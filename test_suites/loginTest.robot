*** Settings ***
Documentation    Simple Login Test robot for Signant Health

Library    SeleniumLibrary

Suite Setup    Open Browser    ${loginpage}    ${browser}    alias=browserWind
Suite Teardown     Close Browser

*** Variables ***
${loginpage}        http://127.0.0.1:8080
${browser}        chrome

*** Test Cases ***
User Moves From Index Page To Login Page
    Given Index Page Is Opened
    When Open Login
    Then Login Is Shown

User From Login page To Register Page
    When Open Register Page
    Then All Register Page Labels Are Shown


*** Keywords ***
Index Page Is Opened
    Sleep     2
    Title Should Be    index page - Demo App

Open Login
    [Documentation]    Use href to open link.
    Click Link    Log In

Login Is Shown
    Title Should Be   Log In - Demo App

Open Register Page
    [Documentation]    Use href to open link.
    Click Link    Register

All Register Page Labels Are Shown
    #${labels} =    Get Selected List Labels   method=post
    #Element Should Be Visible    label=username
    Element Should Be Visible    id=username
    #Element Should Be Visible    label=password
    Element Should Be Visible    id=password
    #Element Should Be Visible    label=firstname
    Element Should Be Visible    id=firstname
    #Element Should Be Visible    label=lastname
    Element Should Be Visible    id=lastname
    #Element Should Be Visible    label=phone
    Element Should Be Visible    id=phone

*** Comments ***
As a UI user I can:

    Register through web portal
    Review my own user information from the main view

As an API Consumer I can:

    Register new users
    Review users registered in system
    If authenticated I can get personal information of users
    If authenticated I can update personal information of users


   