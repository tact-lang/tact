contract TestUnaryMinus {
    receive() {
        dump(-1);
        dump(-(-5));
        // Testing double negation
        dump(--10); // should produce 10
    }
}
