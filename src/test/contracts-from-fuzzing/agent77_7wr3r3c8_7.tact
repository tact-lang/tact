contract Test {
    receive() {
        // Test bitwise NOT operator: ~(~0) should yield 0
        let x: Int = ~(~0);
        dump(x);
    }
}
