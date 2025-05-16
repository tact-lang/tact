contract Test {
    receive() {
        dump("escape test: \\ newline: \n, tab: \t, quote: \"");
    }
}
