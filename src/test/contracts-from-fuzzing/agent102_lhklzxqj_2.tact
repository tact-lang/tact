fun test() : String {
    // Testing multiple escape sequences in a string literal
    return "Line1\nLine2\tTabbed\"Quote\"\\";
}

contract TestContract {
    receive() {
        test();
    }
}
