contract TestContract {
    receive() {
        // Testing string literal with '\n' escape sequence
        dump("Line1\nLine2");
    }
}
