contract Test {
    receive() {
        // Test: Invoking fromBase64() on an invalid Base64 string should throw an exception with exit code 134.
        // We'll wrap this in a try...catch block to capture and dump the error.
        let s: String = "not_base64";
        try {
            // This should fail because "not_base64" contains characters not in the Base64 alphabet
            let sl: Slice = s.fromBase64();
            dump(0); // if no exception, dump 0
        } catch (err) {
            dump(err); // expected to dump exit code 134
        }
    }
}
