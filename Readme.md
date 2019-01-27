# Raspberry Pi Print Server

## Instructions

1.   [Install Latest Raspbian (stretch).](https://www.raspberrypi.org/documentation/installation/installing-images/)
2.   Run the script on your Raspberry Pi:
    1.   copy the file `configure.sh` to your Raspberry Pi
        -   `scp configure.sh pi@raspberry:/tmp`
    2.   [ssh to your Raspberry Pi](https://www.raspberrypi.org/documentation/remote-access/ssh/)
        -   `ssh pi@raspberry`
    3.   run it.
        -   `sudo /tmp/configure "printers"`
3.   Connect to yor print server on `https://{your_raspbery_pi_ip_address}:631/`
