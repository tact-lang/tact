fun bigUnicodeChar(): Int {
    // This character 𠜎 is a 4-byte Unicode code point
    return ascii("𠜎");
}

contract Test {
    receive() {
        bigUnicodeChar();
    }
}
