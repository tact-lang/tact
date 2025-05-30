contract TestOperators {
    receive() {
        // Test modulo operator with a negative divisor
        // According to documentation:
        // 1 % -5 should yield -4
        let a = 1 % -5;
        dump(a);
        cashback(sender());
    }
}
