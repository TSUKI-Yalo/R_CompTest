*** Settings ***
Library           OperatingSystem
Library           Collections
Library           SSHLibrary
Resource          TEST/connet/SSHKeywords.robot

*** Variables ***
${filename}    ${EMPTY}

*** Keywords ***
Find And Store JSON Files On Server
    [Arguments]    @{search_paths}
    ${file_contents}=   Create Dictionary
    SSHKeywords.Connect to Server
    FOR    ${path}    IN    @{search_paths}
        ${result}=      Execute Command      ls ${path}/*.json
        FOR     ${file_path}     IN     @{result.split()}
            ${file_name}=   Get File Name Without Extension  ${file_path}
            ${content}=      Execute Command       cat ${file_path}
            Set To Dictionary   ${file_contents}  "${file_name}"  "${content}"
#            Log Many   File Name: ${file_name},context:${content}
        END
    END
    SSHKeywords.Close SSH Connection
Get File Name Without Extension
    [Arguments]  ${full_file_path}
    ${split_list}=  Evaluate  "${full_file_path}".rsplit('/',1)
	${filename_with_extension}=  Evaluate  "${split_list[-1]}".rsplit('.',1)[0]
	Run Keyword If    '${filename_with_extension[-2: ]}' == '_A'
        ...   Set Test Variable     ${filename}     '${filename_with_extension[:-3]}1'
     ...   ELSE IF     '${filename_with_extension[-2: ]}' == '_B'
        ...   Set Test Variable     ${filename}      '${filename_with_extension[:-3]}2'
     ...   ELSE IF     '${filename_with_extension[-2: ]}' == '_C'
        ...   Set Test Variable    ${filename}      '${filename_with_extension[:-3]}3'
     ...   ELSE IF     '${filename_with_extension[-2: ]}' == '_D'
        ...   Set Test Variable       ${filename}     '${filename_with_extension[:-3]}4'
     ...   ELSE
        ...   Set Test Variable       ${filename}     ${filename_with_extension}
	 RETURN  ${filename}

*** Test Cases ***
Verify JSON Are Successful
    Find And Store JSON Files On Server       /home/inexbot/robot/config
    Find And Store JSON Files On Server       /home/inexbot/robot/craft/*
    Find And Store JSON Files On Server       /home/inexbot/robot/variant