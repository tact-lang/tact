contract TestInvalidBase64 {
    receive() {
        // Testing fromBase64 with invalid base64 characters
        let s: String = "NotBase64!";
        let _ : Slice = s.fromBase64();
    }
}
