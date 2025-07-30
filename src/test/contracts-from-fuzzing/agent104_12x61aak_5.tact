fun testHexEscape(): String {
    return "Quote: \x22"; // \x22 represents a double quote
}

contract TestContract {
    receive() {
        let s: String = testHexEscape();
    }
}
