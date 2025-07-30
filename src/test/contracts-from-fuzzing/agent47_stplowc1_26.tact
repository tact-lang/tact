contract TestFromBase64Invalid {
    receive() {
        // This should trigger an exception at runtime with exit code 134: "Invalid argument"
        // because the string contains non-Base64 characters.
        let s: String = "invalid!";
        s.fromBase64();
    }
}
