contract Test {
    receive() {
        dump("Valid escape: \x41");
    }
}
