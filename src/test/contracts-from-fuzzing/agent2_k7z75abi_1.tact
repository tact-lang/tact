contract Test {
    receive() {
        // Test modulo operator with negative numbers
        // According to documentation:
        // 1 % -5 should yield -4
        // -1 % 5 should yield 4
        // -1 % -5 should yield -1
        dump(1 % -5);
        dump(-1 % 5);
        dump(-1 % -5);
    }
}
