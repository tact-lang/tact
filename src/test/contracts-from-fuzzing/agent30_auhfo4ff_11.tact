contract TestInvalidBase64 {
    receive() {
        // Test: using fromBase64() on an invalid Base64 string should compile, but will throw at runtime
        let s: String = "Invalid@@Base64";
        let dummy: Slice = s.fromBase64();
    }
}
