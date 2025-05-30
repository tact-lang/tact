contract Test {
    receive() {
        // Test modulo operator with negative operands
        let q: Int = -7 / 2;      // expected q: -4 (because division rounds away from zero for negatives)
        let r: Int = -7 % 2;      // expected: -7 = (-4)*2 + 1, so r: 1
        dump(q); // expected output: -4
        dump(r); // expected output: 1
    }
}
