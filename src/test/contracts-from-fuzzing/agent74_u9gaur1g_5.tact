contract TestContract {
    receive() {
        "Hex escape test: \x41\x42\x43"; // should yield "ABC"
    }
}
