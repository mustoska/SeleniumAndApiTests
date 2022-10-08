*** Settings ***
Documentation    Simple Login Test robot for Signant Health

Library    SeleniumLibrary

Suite Setup    Open Browser    ${loginpage}    ${browser}    alias=browserWind
Suite Teardown     Close Browser

*** Variables ***
${loginpage}        http://127.0.0.1:8080
${browser}        chrome

*** Test Cases ***
User Moves From Index Page To Loginpage
    Given Index Page Is Opened
    When Open Login
    Then Login Is Shown


*** Keywords ***
Index Page Is Opened
    Sleep     2
    Title Should Be    index page - Demo App

Open Login
    [Documentation]    Use href to open link.
    Click Link    Log In

Login Is Shown
    Title Should Be   Log In - Demo App

   