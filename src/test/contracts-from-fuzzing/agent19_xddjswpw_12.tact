contract Test {
    receive() {
        // Checking fromBase64() with invalid characters.
        // Documentation states if invalid chars are found, thrown an exception with exit code 134.
        let s = "###".fromBase64();
    }
}
