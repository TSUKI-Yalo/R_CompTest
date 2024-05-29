*** Settings ***
Library           SSHLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${SERVER_IP}         192.168.10.204
${SERVER_PORT}       22
${SERVER_USERNAME}   inexbot
${SERVER_PASSWORD}   123

*** Keywords ***
Connect to Server
    [Documentation]    Connects to the server using SSH.
    Open Connection     ${SERVER_IP}
    Login               ${SERVER_USERNAME}     ${SERVER_PASSWORD}

Close SSH Connection
    [Documentation]     Closes the SSH connection.
    Close All Connections

*** Test Cases ***
comm
    Connect to Server
    Close SSH Connection
