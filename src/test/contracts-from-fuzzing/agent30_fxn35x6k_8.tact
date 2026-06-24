contract TestContract {
    receive() {
        let str: String = "SGVsbG8gd29ybGQ="; // Base64 for "Hello world"
        let slice: Slice = str.fromBase64();
    }
}