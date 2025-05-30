fun base64Huge(): Slice {
    // 200 'A' characters – valid Base64, definitely over 1023 bits once decoded.
    let s: String = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
    // Attempt to decode a base64 string that yields >1023 bits.
    return s.fromBase64();
}

contract Test {
    receive() {
        base64Huge();
    }
}