*** Settings ***
Library           RedisLibrary
Library           OperatingSystem
Library           String
Library           Collections
*** Variables ***
${REDIS_IP}          192.168.10.203
${REDIS_PORT}        6379
${REDIS_USERNAME}    default
${REDIS_PASSWORD}    inexbot_rw_2024
*** Keywords ***
#Connect To Redis Pool
#    [Documentation]     Connects to the Redis database using a connection pool.
#    ${redis_url}=   Set Variable    redis://${REDIS_USERNAME}:${REDIS_PASSWORD}@${REDIS_IP}:${REDIS_PORT}
#    Run Keyword And Ignore Error    Connect To Redis From URL  ${redis_url} db=0
#    ${result}   Redis Key Should Be Exist	${REDIS_IP}     BARCODE
#    RETURN  ${result}

Connect To Redis Pool
    [Documentation]     Connects to the Redis database using a connection pool.
    ${redis_add}  Connect To Redis   ${REDIS_IP}  ${REDIS_PORT}    0    redis_password=${REDIS_PASSWORD}
    RETURN  ${redis_add}