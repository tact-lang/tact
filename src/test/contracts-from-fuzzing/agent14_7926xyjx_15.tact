fun invalidBase64(): Slice {
    // Exclamation mark is not a valid base64 character
    return "!".fromBase64();
}

contract Test {
    receive() {
        invalidBase64();
    }
}