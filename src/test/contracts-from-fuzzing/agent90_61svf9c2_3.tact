fun test2() : String {
    // Testing \x escape sequence for double quote (\x22 is double quote)
    return "Quote: \x22 End";
}

contract TestContract2 {
    receive() {
        test2();
    }
}
