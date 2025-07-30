contract TestUnaryMinus {
    receive() {
        // Unary minus applied twice, should yield original positive number
        let a: Int = -(-1);
        dump(a); // Expected output: 1
    }
}
