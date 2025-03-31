contract Test {
    receive() {
        // Test modulo operator with negatives
        // According to documentation:
        // -1 % 5 should yield 4
        // 1 % -5 should yield -4
        dump(-1 % 5);
        dump(1 % -5);
    }
}
