contract TestPrecedence {
    receive() {
        let result1: Int = 5 * 5 - 2;  // expected: 23
        let result2: Int = 5 * (5 - 2);  // expected: 15
        dump(result1);
        dump(result2);
    }
}
