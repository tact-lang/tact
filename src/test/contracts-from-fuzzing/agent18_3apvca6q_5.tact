contract TestBinaryAddition {
    receive() {
        dump(1 + 2);        // should output 3
        dump((1 + 2) * 3);    // precedence test: should output 9
    }
}
