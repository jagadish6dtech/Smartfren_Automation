*** Settings ***
Documentation   Sample TestCase For Automation FrameWork
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../Resource/PageKeywords/SF_Login_Keyword.robot
Resource    ../Resource/PageKeywords/SF_UI_Keywords.robot


Resource    ../Resource/PageKeywords/Read_TestData_Keyword.robot
Library  ../Resource/TestData/Provision_Functions.py
Library  ../Resource/TestData/ReadDataFromExcel.py

Variables    ../Resource/PageObjects/PageObjects.yaml
Variables    ../Resource/PageObjects/TestData.yaml
Resource     ../Resource/PageKeywords/Common.robot

Library  OperatingSystem


Test Setup        Execute Suite Setup as User
Test Teardown     Execute Suite Teardown

*** Variables ***

${CRM_TestData}     ${TestData}[CRM_TestData]
${SMARTFREN_TESTDATA}     ${TestData}[SMARTFREN_TESTDATA]
${SmartFern_CREDENTIAL}     ${TestData}[USER][SmartFern_user]



*** Test Cases ***
TEST CASE 009
    [Documentation]    To create/Edit/Delete various Mbooklet Types
    Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username1]  ${SmartFern_CREDENTIAL}[password1]


    Create Various Mbooklet Types as Product           TC_001  TD_01
    Create Various Mbooklet Types as Programs          TC_001  TD_02
    Create Various Mbooklet Types as Video on Demand   TC_001  TD_03
    Create Various Mbooklet Types as Tips & Tricks     TC_001  TD_04
    Create Various Mbooklet Types as Q&A               TC_001  TD_05

    Edit Various Mbooklet Types as Product             TC_001  TD_01
    Edit Various Mbooklet Types as Programs            TC_001  TD_02
    Edit Various Mbooklet Types as Video on Demand     TC_001  TD_03
    Edit Various Mbooklet Types as Tips & Tricks       TC_001  TD_04
    Edit Various Mbooklet Types as Q&A                 TC_001  TD_05




    Sleep  10s
