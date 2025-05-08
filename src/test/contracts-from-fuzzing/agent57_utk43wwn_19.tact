contract Test {
    receive() {
        // Test M: Using string.fromBase64 with an invalid Base64 encoded string
        // This should result in an exception with exit code 134 (Invalid argument)
        let s: String = "NotBase64!!";
        let _ = s.fromBase64();
        dump("This line should not be reached if exception is thrown");
    }
}
