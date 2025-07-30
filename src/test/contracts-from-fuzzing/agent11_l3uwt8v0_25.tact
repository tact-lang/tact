contract TestLargeBase64 {
    receive() {
        // Create a Base64 valid string with length 171 characters (each 'A' is valid in Base64).
        // This should decode only the first 1023 bits without error, even though the string is longer.
        let s: String = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"; // 171 characters
        let decoded: Slice = s.fromBase64();
    }
}
