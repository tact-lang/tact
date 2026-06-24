contract Test {
    receive() {
        // Test invalid usage of toFloatString: passing 78 as digits should be rejected,
        // because the valid range is 0 < digits < 78. According to documentation, this should throw an exception with exit code 134.
        let s: String = (42).toFloatString(78);
    }
}
