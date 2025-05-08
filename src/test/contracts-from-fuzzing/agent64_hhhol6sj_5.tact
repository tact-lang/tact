fun testEmptyString(): String {
    return "";
}

contract TestContract {
    receive() {
        let s = testEmptyString();
    }
}
