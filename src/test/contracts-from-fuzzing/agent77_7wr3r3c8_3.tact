contract Test {
    receive() {
        // Test unary plus operator, which according to documentation should behave as binary add
        let a: Int = +5;
        dump(a);
    }
}
