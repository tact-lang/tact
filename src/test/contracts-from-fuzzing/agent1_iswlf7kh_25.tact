contract TestFromBase64LongValid {
    receive() {
        // Generate a long valid Base64 string: consists solely of 'A' which is valid base64 char.
        // According to documentation, fromBase64() only decodes the first 1023 bits.
        let base64Str: String = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
        let s: Slice = base64Str.fromBase64();
    }
}
