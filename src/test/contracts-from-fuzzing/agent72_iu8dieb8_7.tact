contract TestPrecedence {
    receive() {
        let a: Int = 5 * 5 - 2;     // Expected: 23
        let b: Int = 5 * (5 - 2);     // Expected: 15
        let c: Int = 5 - 2 * 5;       // Expected: -5
        let d: Int = (5 - 2) * 5;     // Expected: 15
    }
}
