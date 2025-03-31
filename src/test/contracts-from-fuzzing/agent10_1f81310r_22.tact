fun decodeEmptyBase64(): Slice {
    return "".fromBase64(); // empty string, attempt to decode
}

contract TestContract {
    receive() {
        decodeEmptyBase64();
    }
}
