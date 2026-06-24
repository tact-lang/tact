contract TestBinaryOperators {
    receive() {
        dump(1 + 2);      // expected: 3
        dump(4 - 1);      // expected: 3
        dump(2 * 3);      // expected: 6
        dump(8 / 2);      // expected: 4
        dump(10 % 3);     // expected: 1
    }
}
