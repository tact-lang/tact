contract E {
    receive() {
        // Test that codeOf returns the current contract's code equivalent to myCode()
        let code_via_myCode = myCode();
        let code_via_codeOf = codeOf E;
        // Although equality comparison might not be validated at compile time,
        // this expression must compile and execute without error.
        code_via_myCode == code_via_codeOf;
    }
}
