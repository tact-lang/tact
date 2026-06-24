contract Test {
    init() {
        let base64: String = "SGVsbG8gd29ybGQh"; // "Hello world!"
        let decoded: Slice = base64.fromBase64();
    }
}