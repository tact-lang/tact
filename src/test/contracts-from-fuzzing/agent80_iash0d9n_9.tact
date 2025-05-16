fun testEmptyString(): Int {
    // Test an empty string literal
    let s: String = "";
    // Computing hashData() of an empty string might return a valid hash
    return s.hashData();
}

contract TestContract {
    receive() {
        dump(testEmptyString());
    }
}
