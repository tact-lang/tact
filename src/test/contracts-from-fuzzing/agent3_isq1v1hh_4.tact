contract Test {
    receive() {
        // Testing unary negation operator
        dump(-42);
        dump(-(-1));
    }
}
