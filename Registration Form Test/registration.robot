*** Settings ***
Documentation     A variable driven test case to register a new user
...
...               This test has a workflow that is created using keywords in
...               the imported resource file. 
Resource          resource.robot

*** Test Cases ***
Valid Login

	Open Browser To Home Page
	
	Go To Home Page

	Home Page Should Be Open

	Go To Register Page

	Register Page Should Be Open
    
	Input Firstname    ${FIRSTNAME}

	Input Lastname     ${LASTNAME}  
    
	Input Phone        ${PHONE}
   
	Input Username     ${USERNAME}
   
	Input Address1     ${ADDRESS1}

	Input Address2     ${ADDRESS2}
   
	Input City         ${CITY}
   
	Input State        ${STATE}

	Input Postalcode   ${POSTALCODE}

	Input Email        ${EMAIL}
   
	Input Password     ${PASSWORD}
    
	Input Confirm Password    {CONFIRM_PASSWORD}
   
	Submit Credentials

	Welcome Page Should Be Open
    
	[Teardown]    Close Browser

