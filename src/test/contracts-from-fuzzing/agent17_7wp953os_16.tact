contract Test {
    receive() {
        let s: String = "invalid base64##";
        let x = s.fromBase64();
    }
}
