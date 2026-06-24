contract Main {
    receive() {
       // Test: Check that myCode() equals codeOf for the current contract
       myCode() == codeOf Main;
    }
}
