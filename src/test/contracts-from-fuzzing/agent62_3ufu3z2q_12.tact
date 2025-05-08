contract Test {
    receive() {
        // Test: using fromBase64 on a valid base64-encoded string, and comparing with asSlice conversion
        let s: String = "SGVyZSdzIEpvaG5ueSE="; // Base64 for "Here's Johnny!"
        let slice1: Slice = s.fromBase64();
        let slice2: Slice = s.asSlice().fromBase64();
        // Convert slices back to string if possible (using asString) and compare
        if (slice1.asString() != slice2.asString()) {
            throw(1);
        }

        // Test: using fromBase64 on a string with invalid base64 characters
        // This test expects a runtime throw with exit code 134: "Invalid argument"
        // Uncomment the following lines to observe the runtime error
        // let invalid: String = "AA@BB==";
        // let _invalidSlice: Slice = invalid.fromBase64();
    }
}
