contract TestUnaryOps {
    receive() {
        // Unary minus and unary plus
        dump(-42);
        dump(+42);
    }
}
