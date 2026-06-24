contract SelfCodeTest {
    receive() {
        // Testing that codeOf for the current contract equals myCode()
        let eq = myCode() == codeOf SelfCodeTest;
    }
}
