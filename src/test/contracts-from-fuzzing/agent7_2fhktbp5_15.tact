contract TestLogicalShortCircuit {
    receive() {
        // Test short-circuit evaluation: the left operand is true, so the division by zero in the right operand should not be evaluated
        let flag: Bool = true || (50 / 0 > 0);
        dump(flag);
    }
}
