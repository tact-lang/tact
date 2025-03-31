fun testEmptyString(): String {
    return "";
}

contract TestContract {
    receive() {
        let s: String = testEmptyString();
    }
}
