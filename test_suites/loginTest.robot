*** Settings ***
Documentation    Simple Login Test robot for Signant Health

...              Requirements:
...              As a UI user I can:
...              Register through web portal
...              Review my own user information from the main view

...              As an API Consumer I can:
...              Register new users
...              Review users registered in system
...              If authenticated I can get personal information of users
...              If authenticated I can update personal information of users

Resource    ../custom_keywords/ui_robot_keywords.robot
Library    SeleniumLibrary
Suite Setup    LoginTest Suite Setup
Suite Teardown    LoginTest Suite Teardown

*** Variables ***
${loginpage}      http://127.0.0.1:8080
${browser}        chrome

*** Test Cases ***
User Moves From Index Page To Login Page
    Given Index Page Is Opened
    When Open Login
    Then Login Page Is Shown

As A UI User I Can Register Through Web Portal
    Given Open Register Page
    And All Register Page Labels Are Shown
    When On Register Page User Registers    Bruce1939    IAmBatman    Bruce    Wayne    +555 111 345
    Then Login Page Is Shown

As A User I Can Review My Own User Information From The Main View
    Given Login Page Is Shown
    When User Logs in wit Username "Bruce1939" and Password "IAmBatman"
    Then Wait For User Information Page
    And User Information Page Contains        Bruce1939    Bruce    Wayne    +555 111 345

*** Keywords ***
LoginTest Suite Setup
    Open Browser    ${loginpage}    ${browser}    alias=browserWind

LoginTest Suite Teardown
    Close Browser
