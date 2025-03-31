contract TestContract {
    receive() {
        let big64 = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
        // Attempt to decode a base64 string that is definitely over 127 bytes.
        // Per docs, fromBase64() should only take the first 1023 bits (~127 bytes)
        // and ignore the rest without throwing an exception.
        let decoded = big64.fromBase64();
    }
}
