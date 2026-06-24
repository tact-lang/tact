contract TestContract {
    receive() {
        // Testing string literal with hex escape sequences for double quotes
        dump("He said: \x22Hello\x22.");
    }
}
