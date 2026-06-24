contract TestBinaryOperators {
    receive() {
        // Binary operators
        dump(2 + 2);       // expected: 4
        dump(10 - 5);      // expected: 5
        dump(7 * 6);       // expected: 42
        dump(8 / 2);       // expected: 4
    }
}
