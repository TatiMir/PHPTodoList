1. Instalieren Linux an Raspberry Pi 3B+:
    - wir brauchen Raspberry Pi 3B+ und micro CD 16GB.
    - Gehen wir zur Website https://www.raspberrypi.com/documentation/computers/getting-started.html um Linux (64-bit) yu installieren.

2. Statische IP-adresse erstellen:
    - in Eingabeaufforderung:
        ~ $ ip a

    - eth0: 192.168.0.65/24  das ist unsere IP adresse jetzt, wir wollen das an
            192.168.0.182 andern.

    - Bevor Sie mit der Zuteilung einer statischen privaten IP-Adresse für den Raspberry Pi beginnen, prüfen Sie aber zunächst über den folgenden Befehl, ob DHCPCD bereits aktiviert ist:
        ~ $ sudo service dhcpcd status 

    - Sollte dies nicht der Fall sein, aktivieren Sie den DHCPC wie folgt:
        ~ $ sudo service dhcpcd start
        ~ $ sudo systemctl enable dhcpcd

    - Mit der Bearbeitung des aktivierten DHCPCDs beginnen Sie, indem Sie die Konfigurationsdatei /etc/dhcpcd.conf öffnen und folgendes Kommando ausführen:
        ~ $ sudo nano /etc/dhcpcd.conf

    - Der komplette Befehl sieht dann in unserem Beispiel (in dem ein Netzwerkkabel für die Internetverbindung genutzt wird) so aus:

        ~ $ interface eth0
        ~ $ static ip_address=192.168.0.182/24
        ~ $ static routers=192.168.0.65
        ~ $ static domain_name_servers=192.168.0.65

    - Durch einen Neustart werden die neu vergebenen statischen IP-Adressen im Netzwerk übernommen:

        ~ $ sudo reboot

3. Aktuelles Arbeitsverzeichnis ausgeben: ~ $ pwd

4. Inhalt des aktuellen Verzeichnisses ausgeben: ~ $ ls

5. Neues Verzeichnis /home/<Benutzer>/test erstellen: ~ $ mkdir test

6. In das neu erstellte Verzeichnis wechseln: ~ $ cd test

7. Neue Textdatei im Verzeichnis erstellen und verändern: 

    ~ $ nano test.txt 
    (text eingeben) 
    ctrl+X
    Enter

8. Hostnamen des Computers abfragen: hostname

9. Systemauslastung anzeigen: mpstat -P ALL

10. Normaler Benutzer „willi“ ohne Administratorrechte erstellen: 

    cat /etc/passwd - sehen alle Benutzer 
    sudo useradd -m willi - neue Benutzer ohne SSH Rechte

11. Benutzer „fernzugriff“ für den Zugriff von außen mittels SSH mit sudo-Rechten erstellen:

    sudo useradd -m fernzugriff
    sudo passwd fernzugriff

12. SSH-Dienst für den Benutzer „fernzugriff“ zur Administration:

    sudo apt-get install openssh-server
    sudo service ssh start
    ifconfig

    Sofern der SSH-Service noch inaktiv und auch der automatische Start bei einem Reboot nicht aktiviert ist, können Sie dies mit der Eingabe zweier weiterer Kommandos ändern:

    sudo systemctl enable ssh
    sudo systemctl start ssh

13. Deployment der Web-App „Todo-Listen-Verwaltung“ als Container:

OHNE DOCKER COMPOSE!!!!!!!!!!!!!!

    $ sudo apt-get update
    ~ $ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    ~ $ sudo docker run hello-world

    ~ $ sudo docker volume create portainer_data

    ~ $ docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest


    ~ $ docker run -p 9000:9000
    ~ $ docker ps

    Muss portainer restart:

    ~ $ sudo docker restart portainer
    $ docker run -p 9000:9000

    Dann gehen wir:  localhost:9443
    admin, portaineradmin

    Schreiben wir login und password: admin (portaineradmin - passswort)

    Get started - local - Containers

    Unsere container erstellen:

    Add container - Name (TodoListContainer) - Image (homeassistant/home-assistant)

    Restart policy - Always

    Network - schreiben wir unsere network, hostname - Deploy the container

14. Container mit docker.compose:




     
