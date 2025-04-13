*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         http://the-internet.herokuapp.com/login
${USERNAME}    tomsmith
${PASSWORD}    SuperSecretPassword!

*** Test Cases ***
Valid Login Test 
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    id=username    10s
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Wait Until Element Is Visible    xpath=//button[@type="submit"]    5s
    Click Button    xpath=//button[@type="submit"]
    Wait Until Page Contains    Secure Area    10s
    Log    ✅ Login succesvol!
    Sleep    1s
    Close Browser
