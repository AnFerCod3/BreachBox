#!/bin/bash
# Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Function to handle Ctrl+C
function ctrl_c(){
    echo -e "\n\n$redColour[!] Exiting...$endColour \n"
    exit 1
}
trap ctrl_c INT

# Function to display the main menu
mostrar_menu() {
    echo -e "${blueColour}=======================${endColour} ${yellowColour}IP: $ip${endColour}"
    echo -e "${greenColour}       Menu            ${endColour}"
    echo -e "${blueColour}=======================${endColour}"
    echo -e "${purpleColour}1. Port Scanning${endColour}"
    echo -e "${purpleColour}2. Directory Scanning${endColour}"
    echo -e "${purpleColour}3. SQL Injection${endColour}"
    echo -e "${purpleColour}4. Exit${endColour}"
    echo -e "${blueColour}=======================${endColour}"
}

# Function to display nmap options
mostrar_opciones_nmap() {
    echo -e "${blueColour}===========================${endColour}"
    echo -e "${greenColour}   nmap Options           ${endColour}"
    echo -e "${blueColour}===========================${endColour}"
    echo -e "${purpleColour}1. Fast Scan (-T4 -F)${endColour}"
    echo -e "${purpleColour}2. Full Scan (-p-)${endColour}"
    echo -e "${purpleColour}3. Service Detection (-sV)${endColour}"
    echo -e "${purpleColour}4. OS Detection (-O)${endColour}"
    echo -e "${purpleColour}5. Vulnerability Scan (-sV --script=vuln)${endColour}"
    echo -e "${purpleColour}6. Custom Options${endColour}"
    echo -e "${purpleColour}7. Return to Main Menu${endColour}"
    echo -e "${blueColour}===========================${endColour}"
}

# Function to execute nmap based on selected options
escaneo_nmap() {
    echo -e "${yellowColour}Enter the filename to save results:${endColour}"
    read archivo

    while true; do
        clear
        mostrar_opciones_nmap
        echo -n "Select an option for nmap: "
        read opcion_nmap

        case $opcion_nmap in
            1)
                echo "Running nmap with fast scan..."
                nmap -T4 -F -oG $archivo $ip
                ;;
            2)
                echo "Running nmap with full scan..."
                nmap -p- -oG $archivo $ip
                ;;
            3)
                echo "Running nmap with service detection..."
                nmap -sV -oG $archivo $ip
                ;;
            4)
                echo "Running nmap with OS detection..."
                nmap -O -oG $archivo $ip
                ;;
            5)
                echo "Running nmap with vulnerability scan..."
                nmap -sV --script=vuln -oG $archivo $ip
                ;;
            6)
                echo -e "${yellowColour}Enter custom nmap options:${endColour}"
                read opciones_personalizadas
                echo "Running nmap with custom options..."
                nmap $opciones_personalizadas -oG $archivo $ip
                ;;
            7)
                break
                ;;
            *)
                echo "Invalid option. Please select a number from 1 to 7."
                ;;
        esac

        echo -e "${greenColour}Results saved in ${archivo}${endColour}"
        echo
    done
}

# Function to display gobuster options
mostrar_opciones_gobuster() {
    echo -e "${blueColour}===========================${endColour}"
    echo -e "${greenColour}   Gobuster Options       ${endColour}"
    echo -e "${blueColour}===========================${endColour}"
    echo -e "${purpleColour}1. Directory Scan${endColour}"
    echo -e "${purpleColour}2. Subdomain Scan${endColour}"
    echo -e "${purpleColour}3. Custom Options${endColour}"
    echo -e "${purpleColour}4. Return to Main Menu${endColour}"
    echo -e "${blueColour}===========================${endColour}"
}

# Function to execute gobuster based on selected options
escaneo_gobuster() {
    echo -e "${yellowColour}Enter the filename to save results:${endColour}"
    read archivo

    while true; do
        clear
        mostrar_opciones_gobuster
        echo -n "Select an option for gobuster: "
        read opcion_gobuster

        case $opcion_gobuster in
            1)
                echo -e "${yellowColour}Enter the URL to search directories:${endColour}"
                read url
                echo "Running gobuster for directory search..."
                gobuster dir -u $url -w /usr/share/wordlists/dirb/common.txt -o $archivo
                ;;
            2)
                echo -e "${yellowColour}Enter the domain to search subdomains:${endColour}"
                read dominio
                echo "Running gobuster for subdomain search..."
                gobuster dns -d $dominio -w /usr/share/wordlists/dirb/common.txt -o $archivo
                ;;
            3)
                echo -e "${yellowColour}Enter custom gobuster options:${endColour}"
                read opciones_personalizadas
                echo "Running gobuster with custom options..."
                gobuster $opciones_personalizadas -o $archivo
                ;;
            4)
                break
                ;;
            *)
                echo "Invalid option. Please select a number from 1 to 4."
                ;;
        esac

        echo -e "${greenColour}Results saved in ${archivo}${endColour}"
        echo
    done
}

# Function to display sqlmap options
mostrar_opciones_sqlmap() {
    echo -e "${blueColour}===========================${endColour}"
    echo -e "${greenColour}   SQLMap Options         ${endColour}"
    echo -e "${blueColour}===========================${endColour}"
    echo -e "${purpleColour}1. Basic Scan${endColour}"
    echo -e "${purpleColour}2. Automated Detection and Exploitation${endColour}"
    echo -e "${purpleColour}3. Specific Database Scan${endColour}"
    echo -e "${purpleColour}4. Custom Options${endColour}"
    echo -e "${purpleColour}5. Return to Main Menu${endColour}"
    echo -e "${blueColour}===========================${endColour}"
}

# Function to execute sqlmap based on selected options
escaneo_sqlmap() {
    echo -e "${yellowColour}Enter the filename to save results:${endColour}"
    read archivo

    while true; do
        clear
        mostrar_opciones_sqlmap
        echo -n "Select an option for sqlmap: "
        read opcion_sqlmap

        case $opcion_sqlmap in
            1)
                echo -e "${yellowColour}Enter the URL to scan:${endColour}"
                read url
                echo "Running sqlmap with basic scan..."
                sqlmap -u $url --batch --output-dir=$archivo
                ;;
            2)
                echo -e "${yellowColour}Enter the URL to scan:${endColour}"
                read url
                echo "Running sqlmap with automated detection and exploitation..."
                sqlmap -u $url --batch --level=5 --risk=3 --output-dir=$archivo
                ;;
            3)
                echo -e "${yellowColour}Enter the URL to scan:${endColour}"
                read url
                echo -e "${yellowColour}Enter the name of the database:${endColour}"
                read dbname
                echo "Running sqlmap for specific database scan..."
                sqlmap -u $url -D $dbname --batch --dump --output-dir=$archivo
                ;;
            4)
                echo -e "${yellowColour}Enter custom sqlmap options:${endColour}"
                read opciones_personalizadas
                echo "Running sqlmap with custom options..."
                sqlmap $opciones_personalizadas --output-dir=$archivo
                ;;
            5)
                break
                ;;
            *)
                echo "Invalid option. Please select a number from 1 to 5."
                ;;
        esac

        echo -e "${greenColour}Results saved in ${archivo}${endColour}"
        echo
    done
}

# Main script execution
echo -e "${blueColour}===========================${endColour}"
echo "${blueColour}Welcome to Breach Box${endColour}"
echo -e "${blueColour}===========================${endColour}"
echo -e "${yellowColour}Enter the target IP address:${endColour}"
echo -e "${blueColour}===========================${endColour}"
read ip

while true; do
    clear
    mostrar_menu
    echo -n "Select an option: "
    read opcion

    case $opcion in
        1)
            escaneo_nmap
            ;;
        2)
            escaneo_gobuster
            ;;
        3)
            escaneo_sqlmap
            ;;
        4)
            echo -e "${redColour}[!] Exiting...${endColour}"
            exit 0
            ;;
        *)
            echo "Invalid option. Please select a number from 1 to 4."
            ;;
    esac
done
