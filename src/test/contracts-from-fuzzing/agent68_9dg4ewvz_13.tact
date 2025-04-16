contract Test {
    // Test 13: Use try...catch to handle invalid Base64 and check exit code
    receive() {
        try {
            // This should fail because the string is not valid Base64
            let _ : Slice = "NotBase64!".fromBase64();
            // If no error, force a failure
            throw(999);
        } catch (err) {
            // Expect exit code 134 according to docs
            if (err != 134) { throw(1340); }
        }
    }
}
