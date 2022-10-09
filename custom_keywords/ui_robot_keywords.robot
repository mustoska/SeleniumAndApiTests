*** Settings ***
Documentation    Custom keyword library used in simple login test.

*** Keywords ***
Index Page Is Opened
    Sleep     2
    Title Should Be    index page - Demo App

Open Login
    [Documentation]    Use href to open link.
    Click Link    Log In

Login Page Is Shown
    Title Should Be   Log In - Demo App

Open Register Page
    [Documentation]    Use href to open link.
    Click Link    Register

All Register Page Labels Are Shown
    Element Should Be Visible    id=username
    Element Should Be Visible    id=password
    Element Should Be Visible    id=firstname
    Element Should Be Visible    id=lastname
    Element Should Be Visible    id=phone

On Register Page User Registers
    [Arguments]    ${username}    ${password}    ${firstname}    ${lastname}    ${phone}
    Input Text    id=username    ${username}
    Input Text    id=password    ${password}
    Input Text    id=firstname   ${firstname}
    Input Text    id=lastname    ${lastname}
    Input Text    id=phone       ${phone}
    Click Button    Register
