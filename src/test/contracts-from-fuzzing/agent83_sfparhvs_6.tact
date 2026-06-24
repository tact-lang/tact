contract TestBinaryArithmetic {
    receive() {
        let a: Int = 1 + 2 * 3 - 4 / 2;
        let b: Int = (10 - 3) * (2 + 2);
        let c: Int = 42 % 5;
    }
}
