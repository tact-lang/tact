contract TestShortCircuit {
    receive() {
        // Test short-circuit behavior: the right-hand side should not be evaluated
        let b: Bool = true || ( (1 / 0) > 1 );
    }
}
