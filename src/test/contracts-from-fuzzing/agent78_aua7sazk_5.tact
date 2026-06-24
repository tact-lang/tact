contract TestUnary {
    receive() {
        // Unary minus and logical not
        dump(-42);
        dump(!false);
    }
}
