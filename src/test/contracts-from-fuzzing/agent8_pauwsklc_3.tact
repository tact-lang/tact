fun getUnicodeString(): String {
    return "Hello 你好 Tact";
}

contract Test {
    receive() {
        getUnicodeString();
    }
}
