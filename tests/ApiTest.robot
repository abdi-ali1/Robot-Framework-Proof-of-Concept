*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}       https://jsonplaceholder.typicode.com
${ENDPOINT}       /posts/1

*** Test Cases ***
Simple GET Request (zonder CSV)
    # Setup API sessie zonder TLS check
    Create Session    jsonplaceholder    ${BASE_URL}    verify=False

    # Stuur de GET-request
    ${response}=    GET On Session    jsonplaceholder    ${ENDPOINT}

    # Statuscode controleren
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ✅ Statuscode is 200

    # JSON uitlezen
    ${json}=    Convert To Dictionary    ${response.json()}
    Log Dictionary    ${json}

    # Valideer userId
    Dictionary Should Contain Key    ${json}    userId
    Should Be Equal As Integers    ${json['userId']}    1
    Log    ✅ API responded correct met userId 1
