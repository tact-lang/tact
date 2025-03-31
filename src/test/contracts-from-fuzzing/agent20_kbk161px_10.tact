contract TestContract {
    receive() {
        let invalid: String = "not base64???";
        invalid.fromBase64();
    }
}