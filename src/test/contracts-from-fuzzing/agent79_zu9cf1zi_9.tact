contract TestBinaryOperators {
    receive() {
        let a: Int = 10;
        let b: Int = 3;
        // Testing arithmetic binary operators
        dump(a + b); // Expected: 13
        dump(a - b); // Expected: 7
        dump(a * b); // Expected: 30
        dump(a / b); // Expected: 3 (integer division)
    }
}
