contract TestUnaryMinus {
    receive() {
        // Testing unary minus operator
        let y: Int = -123;
        dump(y); // Expected output: -123
    }
}
