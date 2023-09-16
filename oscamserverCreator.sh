#!/bin/bash
####################################################
######## [ Reader Creator OsCam NCam Cccam] ########
###### [ oscam.server/ncam.server/cccam.cfg ] ######
########     [ Created By : ismail9875 ]    ########
########         [ Tangier 15-9-2023 ]      ########
####################################################
#
#



dcw="0102030405060708091011121314"
echo "Type of line server"
echo "[1]Cccam [2]NewCamd [3]MgCamd"
read TypeServer
echo "Type a name for Reader"
read Label
echo "Welcom To the oscam.server ncam.server cccam.cfg Creator"
echo "Type the Host of your Server line"
read Host
echo "Type the Port of Server line"
read Port
echo "Type Username"
read User 
echo "Type Password"
read Password
echo "choice a number From 1 to 64"
read group
if [[ $TypeServer -eq 1 ]]; then
    echo C:$Host $Port $User $Password | tee -a /etc/tuxbox/config/cccam.cfg
    echo """
    [reader]
    label                         = $Label
    enable                        = 1
    protocol                      = $TypeServer
    device                        = $Host,$Port
    user                          = $User
    password                      = $Password
    services                      = !powervu_fake,!tandberg_fake,!biss_fake,!afn_fake
    inactivitytimeout             = 30
    disablecrccws_only_for        = 098C:000000;09C4:000000;098D:000000;0500:030B00,032830,041950,041960,042800,042820,043800,050F00,051A00,051A10,060A00,060C00;1709:000000;1802:000000;1811:000007,000107,023311,003311,003315,003341,00331B;1813:000068;1815:000000;1817:000000,00006A;1818:000000,00006C,000007;1819:00006D;1841:000000;1880:000000;1883:003311;1884:000000;1708:000000;0E00:000000;091F:000000;09BE:000000;092B:000000;4AEE:000001;0B00:000000;0B02:000000;0D97:000000;0653:000000;092F:000000;0B01:000000
    group                         = $group
    dropbadcws                    = 1
    disablecrccws                 = 1
    cccversion                    = 2.3.2
    ccckeepalive                  = 1
    cccreshare                    = 0
    audisabled                    = 1
    """ | tee -a /etc/tuxbox/config/osc9am.server
    echo """
    [reader]
    label                         = $Label
    enable                        = 1
    protocol                      = $TypeServer
    device                        = $Host,$Port
    user                          = $User
    password                      = $Pass
    group                         = $group
    emmcache                      = 2,1,2,1
    cccversion                    = 2.0.11
    ccckeepalive                  = 1
    cccmaxhops                    = 2 # dont use higher than 3 !!!
    disablecrccws                 = 1
    cccwantemu                    = 1
    blockemm-unknown              = 1
    blockemm-u                    = 1
    blockemm-s                    = 1
    blockemm-g                    = 1
    audisabled                    = 1
    services                      = !powervu_fake,!tandberg_fake,!biss_fake,!afn_fake,1708:000000
    disablecrccws_only_for        = 1709:000000;1708:000000;1811:003311,003315;09C4:000000;0500:030B00,042820;0604:000000;1819:00006D;0100:00006D;1810:000000;1884:000000;0E00:000000
    
    """ | tee -a /etc/tuxbox/config/ncam.server
else
then
    echo N:$Host $Port $User $Password $dcw | tee -a /etc/tuxbox/config/cccam.cfg
    echo """

    [reader]
    label                         = $Label
    enable                        = 1
    protocol                      = $TypeServer
    device                        = $Host,$Port
    key                           = $dcw
    user                          = $User
    password                      = $Password
    services                      = !powervu_fake,!tandberg_fake,!biss_fake,!afn_fake,1708:000000
    fallback                      = 1
    group                         = 1,2,3,4,5,6,7,8,9,10,64
    disablecrccws                 = 1
    audisabled                    = 1
    disablecrccws_only_for        = 1709:000000;1708:000000;1811:003311,003315;09C4:000000;0500:030B00,042820;0604:000000;1819:00006D;0100:00006D;1810:000000;1884:000000;0E00:000000

    """ | tee -a /etc/tuxbox/config/oscam.server
    echo """
    [reader]
    label                         = $Label
    enable                        = 1
    protocol                      = $TypeServer
    device                        = $Host,$Port
    key                           = $dcw
    user                          = $User
    password                      = $Password
    services                      = !powervu_fake,!tandberg_fake,!biss_fake,!afn_fake,1708:000000
    fallback                      = 1
    group                         = 1,2,3,4,5,6,7,8,9,10,64
    disablecrccws                 = 1
    audisabled                    = 1
    disablecrccws_only_for        = 1709:000000;1708:000000;1811:003311,003315;09C4:000000;0500:030B00,042820;0604:000000;1819:00006D;0100:00006D;1810:000000;1884:000000;0E00:000000

    """ | tee -a /etc/tuxbox/config/ncam.server
fi
exit 0
