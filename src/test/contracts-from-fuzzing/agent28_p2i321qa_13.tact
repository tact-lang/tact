contract TestPrecedence {
    receive() {
        let a: Int = 5 * 5 - 2;  // Expected: 23
        let b: Int = 5 * (5 - 2); // Expected: 15
        dump(a);
        dump(b);
    }
}
