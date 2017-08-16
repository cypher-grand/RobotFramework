*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         newtours.demoaut.com
${BROWSER}        chrome
${DELAY}          0

${HOME_URL}                 http://${SERVER}/
${REGISTER_URL}             http://${SERVER}/mercuryregister.php
${REGISTER_SUCCESS_URL}     http://${SERVER}/create_account_success.php

${HOME_TITLE}           Welcome: Mercury Tours
${REGISTRATION_TITLE}   Register: Mercury Tours

${FIRSTNAME}         John
${LASTNAME}          Doe
${PHONE}             512.555.1234
${USERNAME}          test@noemail.com
${ADDRESS1}          123 Main Street
${ADDRESS2}          Apt 123  
${CITY}              Austin
${STATE}             Texas
${POSTAL CODE}       78701
${EMAIL}             test@noemail.com
${PASSWORD}          test123
${CONFIRM_PASSWORD}  test123

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${HOME_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Home Page Should Be Open

Home Page Should Be Open
    Title Should Be    ${HOME_TITLE}

Register Page Should Be Open
    Title Should Be     ${REGISTRATION_TITLE}

Go To Home Page
    Go To    ${HOME_URL}
    Home Page Should Be Open

Go To Register Page
    Go To   ${REGISTER_URL}
    Register Page Should Be Open

Input Firstname
    [Arguments]    ${FIRSTNAME}
    Input Text    name=firstName    ${FIRSTNAME}

Input Lastname
    [Arguments]    ${LASTNAME}
    Input Text    name=lastName    ${LASTNAME}

Input Phone
    [Arguments]    ${PHONE}
    Input Text    name=phone    ${PHONE}

Input Username
    [Arguments]    ${USERNAME}
    Input Text    name=userName    ${USERNAME}

Input Address1
    [Arguments]   ${ADDRESS1}
    Input Text    name=address1    ${ADDRESS1}

Input Address2
    [Arguments]    ${ADDRESS2}
    Input Text    name=address2    ${ADDRESS2}

Input City
    [Arguments]    ${CITY}
    Input Text    name=city    ${CITY}

Input State
    [Arguments]    ${STATE}
    Input Text    name=state    ${STATE}

Input Postalcode
    [Arguments]    ${POSTALCODE}
    Input Text     name=postalCode     ${POSTALCODE}

Input Email
    [Arguments]    ${EMAIL}
    Input Text    name=email    ${EMAIL}

Input Password
    [Arguments]    ${PASSWORD}
    Input Text    name=password    ${PASSWORD}

Input Confirm Password
    [Arguments]    ${CONFIRM_PASSWORD}
    Input Text    name=confirmPassword   ${CONFIRM_PASSWORD}


Submit Credentials
    Click Button    register

Welcome Page Should Be Open
    Location Should Be    ${REGISTER_SUCCESS_URL}
    Title Should Be    ${REGISTRATION_TITLE}
