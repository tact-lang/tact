contract TestPrecedence {
    receive() {
        let a: Int = 1 + 2 * 3;      // Expected: 1 + (2*3) = 7
        let b: Int = (1 + 2) * 3;      // Expected: (1+2) * 3 = 9
        dump(a);
        dump(b);
    }
}
