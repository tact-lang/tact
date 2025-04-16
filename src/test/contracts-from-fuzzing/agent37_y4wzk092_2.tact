fun testString(): String {
    return "hello\nworld\t!";
}

contract TestContract {
    receive() {
        let s = testString();
    }
}
