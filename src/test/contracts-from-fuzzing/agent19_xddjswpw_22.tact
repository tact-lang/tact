contract Test {
    receive() {
        // Attempting to parse a 200-char base64 string "AAAA...".
        // This decodes to 1200 bits (200 * 6 = 1200), exceeding the 1023 bit limit.
        // Docs say it should not throw an exception, but will only process the first 1023 bits.
        let bigBase64: String = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
        let result = bigBase64.fromBase64();
    }
}
