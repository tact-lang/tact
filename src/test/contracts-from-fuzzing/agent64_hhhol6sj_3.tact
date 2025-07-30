fun testEscapeString(): String {
    return "Line 1\nLine 2\tTabbed \\ \"quote\" \x41 \u0042 \u{43}";
}

contract TestContract {
    receive() {
        let s = testEscapeString();
    }
}
