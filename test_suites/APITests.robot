*** Settings ***
Documentation    As an API Consumer I can:
...              Register new users
...              Review users registered in system
...              If authenticated I can get personal information of users
...              If authenticated I can update personal information of users
Library    REST     ${API_ADDRESS1}     ssl_verify=false
*** Variables ***
${API_ADDRESS1}    http://127.0.0.1:8080
${API_ADDRESS2}    http://10.127.242.101:8080  

${HEADER}          {"Content-Type": "application/json"}
${TOKEN}

${TEST_USER_1}     { "username":"Spiderman", "password": "IAmSpiderman", "firstname": "Peter", "lastname": "Parker", "phone": "+555 111 222"}
${TEST_USER_2}     { "username":"Wolverine", "password": "IAmHairyBeast", "firstname": "James", "lastname": "Howlett", "phone": "+555 123 123"}

${TEST_USER_1_AUTH}    {"username":"Bruce1939","password": "IAmBatman"}
${TEST_USER_2_AUTH}    { "username":"Spiderman", "password": "IAmSpiderman"}
${TEST_USER_3_AUTH}    { "username":"Wolverine", "password": "IAmHairyBeast"}


*** Comments ***


*** Test Cases ***
As an API Consumer I can Register new users
    POST            /api/users    ${TEST_USER_1}
    Integer         response status       201
    Output          response body        test_results\\APITests.json

As an API Consumer I can Review users registered in system
    [Documentation]    Works without token, maybe shouldn't
    Set Headers    ${HEADER}
    GET             /api/users
    Integer         response status       200
    Output schema    response body

As an API Consumer I can If authenticated I can get personal information of users, Login and Get Token
    ${TOKEN}=     Set Client Authentication    Basic    Bruce1939    IAmBatman
    GET      /api/auth/token
    Integer         response status       200
    Output schema    response body
    Log    ${TOKEN}

As an API Consumer I can If authenticated I can get personal information of users
    Set Headers     {"Token": "${TOKEN}"}
    GET             /api/users
    Integer         response status       200
    Output schema    response body

As an API Consumer I can Register new users
    POST            /api/users    ${TEST_USER_2}
    Integer         response status       201
    Output          response body        test_results\\APITests.json

As an API Consumer I can If authenticated I can update personal information of users
    Set Headers     {"Token": "${TOKEN}"}
    PUT    /api/users/{Spiderman}
    #Integer         response status       200
