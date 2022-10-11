*** Settings ***
Documentation    As an API Consumer I can:
...              Register new users
...              Review users registered in system
...              If authenticated I can get personal information of users
...              If authenticated I can update personal information of users
Library    REST     ${API_ADDRESS1}     ssl_verify=false
*** Variables ***
${LOCAL_HOST}      http://localhost:8080
${API_ADDRESS1}    http://127.0.0.1:8080
${API_ADDRESS2}    http://10.127.242.101:8080  
${TOKEN}           {"status": "SUCCESS","token": "MzMyNjQyMzAzODMwNjk1Mzg1MDU4OTA3MTEyMDM3MTQ2NDg5Mzg2"}
${OUTPUTDIR}        ${CURDIR}\\test_results

${TEST_USER_1}     { "username":"Spiderman", "password": "IAmSpiderman", "firstname": "Peter", "lastname": "Parker", "phone": "+555 111 222"}
${TEST_USER_2}     { "username":"Wolverine", "password": "IAmHairyBeast", "firstname": "James", "lastname": "Howlett", "phone": "+555 123 123"}
*** Test Cases ***


As an API Consumer I can Register new users
    POST            /api/users        ${TEST_USER_1}
    Integer         response status       201
    Output  response body     ${OUTPUTDIR}

As an API Consumer I can Review users registered in system
    GET             /api/auth/token        ${TOKEN} 
    String          response body username    Bruce1939
    Output schema   response body


#As an API Consumer I can If authenticated I can get personal information of users
#As an API Consumer I can If authenticated I can update personal information of users

*** Keywords ***