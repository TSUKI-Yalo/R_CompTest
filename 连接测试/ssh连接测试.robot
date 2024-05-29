*** Settings ***
Library           ../TEST/DATA/JSONDATEGET.robot
Library           ../TEST/connet/SSHKeywords.robot

*** Test Cases ***
sshopen

    Find And Store JSON Files On Server    /home/inexbot/robot/config
