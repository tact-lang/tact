fun test(): Int {
    // Testing escape sequences in string literal
    let s: String = "Line1\nLine2\tTabbed\"Quote\"";
    // Use a string function to incorporate usage
    return s.hashData();
}

contract TestContract {
    receive() {
        test();
    }
}
