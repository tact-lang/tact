contract Test {
    receive() {
        let base64String: String = "SGVsbG8="; // "Hello" in base64
        let s = base64String.fromBase64();
    }
}
