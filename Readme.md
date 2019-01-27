# Raspberry Pi Print Server

## Instructions

-   [Install Latest Raspbian (stretch).](https://www.raspberrypi.org/documentation/installation/installing-images/)
-   copy the file `configure.sh`, [ssh to your raspberry pi](https://www.raspberrypi.org/documentation/remote-access/ssh/), and run it.
    -   `scp configure.sh pi@raspberry:/tmp`
    -   `ssh pi@raspberry`
        -   `sudo /tmp/configure "printers"`
