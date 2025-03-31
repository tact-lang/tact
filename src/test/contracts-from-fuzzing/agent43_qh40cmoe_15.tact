/// Test Case: Comparing myCode() with codeOf for the current contract
contract CompareCode {
    receive() {
         let code1 = myCode();
         let code2 = codeOf CompareCode;
         require(code1 == code2, "Codes mismatch");
    }
}
