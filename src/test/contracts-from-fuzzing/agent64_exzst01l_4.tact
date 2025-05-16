contract TestBinaryArithmetic {
    receive() {
        // Testing basic binary arithmetic: addition and multiplication
        let sum: Int = (10 + 20) * 2; // Expected result: 60
        dump(sum);
    }
}
