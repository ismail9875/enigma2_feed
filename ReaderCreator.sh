#!/bin/sh
# "|===============================================|"
# "|========[     .server/.cfg Creator    ]========|"
# "|========[      Github/ismail9875      ]========|"
# "|========[    Tangier/ 20-Sep-2023     ]========|"
# "|===============================================|"
#
#---° Functions °---#

data_user(){
    printf "Host : "
    read Host
    printf "Port : "
    read Port
    printf "Username : "
    read User
    printf "Pasword"
    read Pass
}
NewCmd_reader(){
echo """
    [reader]
    label                         = ${Label}
    enable                        = 1
    protocol                      = newcamd
    device                        = ${Host},${Port}
    key                           = 0102030405060708091011121314
    user                          = ${User}
    password                      = ${Pass}
    services                      = !powervu_fake,!tandberg_fake,!biss_fake,!afn_fake,1708:000000
    fallback                      = 1
    group                         = ${group}
    disablecrccws                 = 1
    audisabled                    = 1
    disablecrccws_only_for        = 1709:000000;1708:000000;1811:003311,003315;09C4:000000;0500:030B00,042820;0604:000000;1819:00006D;0100:00006D;1810:000000;1884:000000;0E00:000000
"""
}
CCcamd_reader(){
echo """
    [reader]
    label                         = ${Label}
    enable                        = 1
    protocol                      = cccam
    device                        = ${Host},${Port}
    user                          = ${User}
    password                      = ${Pass}
    services                      = !powervu_fake,!tandberg_fake,!biss_fake,!afn_fake
    inactivitytimeout             = 30
    disablecrccws_only_for        = 098C:000000;09C4:000000;098D:000000;0500:030B00,032830,041950,041960,042800,042820,043800,050F00,051A00,051A10,060A00,060C00;1709:000000;1802:000000;1811:000007,000107,023311,003311,003315,003341,00331B;1813:000068;1815:000000;1817:000000,00006A;1818:000000,00006C,000007;1819:00006D;1841:000000;1880:000000;1883:003311;1884:000000;1708:000000;0E00:000000;091F:000000;09BE:000000;092B:000000;4AEE:000001;0B00:000000;0B02:000000;0D97:000000;0653:000000;092F:000000;0B01:000000
    group                         = ${group}
    dropbadcws                    = 1
    disablecrccws                 = 1
    cccversion                    = 2.3.2
    ccckeepalive                  = 1
    cccreshare                    = 0
    audisabled                    = 1
"""
}
MgCamd_reader(){
echo """
    [reader]
    label                         = ${Label}
    enable                        = 1
    protocol                      = mgcamd
    device                        = ${Host},${Port}
    key                           = 0102030405060708091011121314
    user                          = ${User}
    password                      = ${Pass}
    services                      = !powervu_fake,!tandberg_fake,!biss_fake,!afn_fake,1708:000000
    fallback                      = 1
    group                         = ${group}
    disablecrccws                 = 1
    audisabled                    = 1
    disablecrccws_only_for        = 1709:000000;1708:000000;1811:003311,003315;09C4:000000;0500:030B00,042820;0604:000000;1819:00006D;0100:00006D;1810:000000;1884:000000;0E00:000000
""" 
}
serverType(){
    printf "Server line Type : "
    printf """
  [1] CCcam
  [2] NewCamd
  [3] MgCamd
    """;read ServerTp
}
PrintLabel(){
    printf "Name for your line :"
    read Label
}
GroupF(){
    printf "Choice Number between 1 & 64 : "
    read group
}
#"|--------------------------------------------|"
echo "=================================="
echo "======== Readers Creator ========="
echo "=================================="
echo "You like modify :"
printf """
[1] cccam.cfg
[2] oscam.server
[3] ncam.server
""";read fileName

#---- CCcam.cfg ----#
if [[ ${fileName} -eq 1 ]]; then
    serverType
#--- CCcam line ----#
    if [[ ${ServerTp} -eq 1 ]]; then
    data_user
    echo "C: ${Host} ${Port} ${User} ${Pass}" | tee -a /etc/tuxbox/config/CCcam.cfg
#---- NewCamd line ----#
    elif [[ ServerTp -eq 2 ]]; then
    data_user
    echo "N: ${Host} ${Port} ${Use} ${Pass} 0102030405060708091011121314" | tee -a /etc/tuxbox/config/CCcam.cfg
    else
    echo "Sorry! Invalid Entry."
    fi
#---- oscam.server ----#
elif [[ ${fileName} -eq 2 ]]; then
    serverType
#---- cccam line ----#
    if [[ ${ServerTp} -eq 1 ]]; then
        PrintLabel
        data_user
        GroupF
        CCcamd_reader | tee -a /etc/tuxbox/config/oscam.server
#---- NewCamd line ----#
    elif [[ ${ServerTp} -eq 2 ]]; then
        echo "Tape A label for line please : "
        data_user
        GroupF
        NewCamd_reader | tee -a /etc/tuxbox/config/oscam.server
#---- MgCamd Line ----#
    elif [[ ${ServerTp} -eq 3 ]]; then
        PrintLabel
        data_user
        GroupF
        NewCmd_reader | tee -a /etc/tuxbox/config/oscam.server    
    else
        echo "Sorry! Invalid Entry."
    fi
#--- ncam.server ----#
elif [[ ${fileName} -eq 3 ]]; then
    serverType
#---- CCcam line ----#
    if [[ ${ServerTp} -eq 1 ]]; then
        PrintLabel
        data_user
        GroupF
        CCcamd_reader | tee -a /etc/tuxbox/config/ncam.server
#---- NewCamd Line ----#
    elif [[ ${ServerTp} -eq 2 ]]; then
        PrintLabel
        data_user
        NewCmd_reader | tee -a /etc/tuxbox/config/ncam.server
#---- MgCamd Line 
    elif [[ ${ServerTp} -eq 3 ]]; then
        PrintLabel
        data_user
        GroupF
        MgCamd_reader | tee -a /etc/tuxbox/config/ncam.server    
    else
        echo "Sorry! Invalid Entry."
    fi
else
echo "Sorry! Invalid Entry"
fi
exit 0
