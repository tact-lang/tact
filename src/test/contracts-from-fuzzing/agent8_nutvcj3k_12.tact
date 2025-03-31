contract Test {
    receive() {
        // Ternary operator tests
        dump(true ? 1 : 2);    // expected output: 1
        dump(false ? 1 : 2);   // expected output: 2
        dump((5 > 3) ? (2 + 2) : (7 - 3)); // expected: 4
    }
}
