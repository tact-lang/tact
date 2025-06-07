fun testInvalidBase64() : Slice {
    // This string is not valid Base64, so calling fromBase64() should trigger an exception at runtime
    return "NotBase64".fromBase64();
}

contract TestInvalidBase64 {
    receive() {
        testInvalidBase64();
    }
}
