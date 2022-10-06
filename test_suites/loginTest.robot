*** Settings ***
Documentation    Simple Login Test robot for Signant Health

Library    SeleniumLibrary

#Suite Setup    Open Login Page

*** Variables ***
${loginpage}        http://127.0.0.1:8080
${browser}        chrome

*** Test Cases ***
Open Login
    Open Browser    ${loginpage}    ${browser}


*** Keywords ***

   