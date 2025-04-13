*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         http://the-internet.herokuapp.com/login
${USERNAME}    tomsmith
${PASSWORD}    SuperSecretPassword!

*** Test Cases ***
Valid Login Test
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome options}    add_argument    --headless
    Call Method    ${chrome options}    add_argument    --no-sandbox
    Call Method    ${chrome options}    add_argument    --disable-dev-shm-usage
    Create Webdriver    Chrome    options=${chrome options}
    Go To    ${URL}
    Wait Until Element Is Visible    id=username    10s
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    xpath=//button[@type="submit"]
    Wait Until Page Contains    Secure Area    10s
    Sleep    1s
    Close Browser
