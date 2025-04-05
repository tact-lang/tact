contract TestTernary {
    receive() {
        // Valid nested ternary expression: should evaluate to 3
        dump(false ? 1 : false ? 2 : 3);
    }
}
