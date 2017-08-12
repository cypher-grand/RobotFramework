*** Settings ***

*** Test Cases ***
Test Robot Framework Logging
    Log    Test Logging

Test My Robot Framework Logging
    My Logging    My Message    WARN

*** Keywords ***
My Logging
    [Arguments]    ${msg}    ${level}
    Log    ${msg}    ${level}
