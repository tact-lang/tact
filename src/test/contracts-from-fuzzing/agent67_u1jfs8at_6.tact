contract TestUnaryMinus {
    receive() {
        // Unary minus applied twice should yield the original value
        dump(-(-42));
    }
}
