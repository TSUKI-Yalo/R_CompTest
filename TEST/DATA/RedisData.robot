*** Settings ***
Library    RedisLibrary
Resource   TEST/connet/RedisKeywords.robot

*** Keywords ***
Get All Keys From Redis
    [Arguments]     ${redis_pool}
    ${all_keys}=   Call Method  ${redis_pool}  keys  '*'
    RETURN         ${all_keys}

Insert Data Into Database
    [Arguments]     ${redis_pool}  ${key}  ${value}
    Call Method     ${redis_pool}       set        ${key}   ${value}

Check If Parameter Exists In Database
    [Arguments]     ${redis_pool}   ${key}
    ${value}=       Get From Redis  ${redis_pool}   ${key}
    Run Keyword If  '${value}' == 'None' or '${value}' == ''
         ...     Log To Console   Parameter '${key}' does not exist in the database
     ...   ELSE
         ...     Log To Console   Parameter '${key}' exists in the database with value: ${value}

#*** Test Cases ***
#Verify Redisdata Are Successful
#    ${pool}=       RedisKeywords.Connect To Redis Pool
#    Log            Pool: ${pool}
#    ${keys}=       Get All Keys From Redis    ${pool}
#    Log           key: @{keys}
#    ${result}=  Check If Parameter Exists In Database    ${pool}    11