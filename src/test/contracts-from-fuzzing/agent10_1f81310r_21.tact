fun decodeInvalidBase64(): Slice {
    // Contains invalid characters like '@' and '#'$
    return "SGVsbG8g@#$d29ybGQ=".fromBase64();
}

contract TestContract {
    receive() {
        decodeInvalidBase64();
    }
}
