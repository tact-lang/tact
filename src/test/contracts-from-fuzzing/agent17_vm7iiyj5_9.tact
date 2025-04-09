contract CodeSelf {
    receive() {
        // Validate that codeOf for the current contract equals myCode()
        let a = myCode();
        let b = codeOf CodeSelf;
    }
}
