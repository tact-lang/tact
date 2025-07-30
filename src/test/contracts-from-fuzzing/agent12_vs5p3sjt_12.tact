fun testEmptyString(): String {
    return "";
}

contract TestEmptyString {
    receive() {
        testEmptyString();
    }
}
