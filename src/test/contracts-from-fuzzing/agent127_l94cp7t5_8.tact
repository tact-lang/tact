contract ExampleCode {
    receive() {
        // Valid usage: codeOf for current contract equals myCode()
        let eq = myCode() == codeOf ExampleCode;
    }
}
