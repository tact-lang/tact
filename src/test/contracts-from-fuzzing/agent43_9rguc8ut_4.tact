contract TestBinaryOperators {
    receive() {
        dump(40 + 2);
        dump(5 * 6);
        dump(2 + 3 * 4); // precedence: 2 + (3*4) = 14
    }
}
