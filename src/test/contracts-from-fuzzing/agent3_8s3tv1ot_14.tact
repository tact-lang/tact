fun invalidBase64(): Slice {
    let s: String = "abc!xyz"; // invalid base64 text
    let decoded: Slice = s.fromBase64();
    return decoded;
}

contract Test {
    receive() {
        let x = invalidBase64();
    }
}
