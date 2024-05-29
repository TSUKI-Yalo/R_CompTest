*** Settings ***
Library    RedisLibrary
Resource   TEST/DATA/JSONDATEGET.robot
Resource   TEST/DATA/RedisDate.robot
Resource   TEST/connet/RedisKeywords.robot
*** Keywords ***

Check If Parameter Exists In Database
    [Arguments]     ${redis_pool}   ${key}
    ${value}=       Get From Redis  ${redis_pool}   ${key}
    Run Keyword If  '${value}' == 'None' or '${value}' == ''
         ...     Log To Console   Parameter '${key}' does not exist in the database
     ...   ELSE
         ...     Log To Console   Parameter '${key}' exists in the database with value: ${value}

*** Test Cases ***
Verify Redisdata Are Successful
    ${pool}=       RedisKeywords.Connect To Redis Pool
    Log            Pool: ${pool}
    ${result}=  Check If Parameter Exists In Database    ${pool}    11