contract Test {
    receive() {
        // Test String.fromBase64 with an invalid Base64 string.
        // According to documentation, if the string contains characters not from the Base64 set,
        // an exception with exit code 134 should be thrown.
        // Here we use an obviously invalid Base64 string "NotBase64!".
        let s: String = "NotBase64!";
        let _slice: Slice = s.fromBase64();
    }
}
