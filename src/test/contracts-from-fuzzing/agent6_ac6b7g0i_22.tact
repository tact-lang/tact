contract TestLogicalShortCircuit2 {
    // Testing short-circuit behavior of logical AND operator.
    // sideEffect() should not be executed because left operand is false.
    fun sideEffect() : Bool {
        dump(999); // if executed, will dump 999 (should not happen)
        return true;
    }
    
    receive() {
        let r: Bool = false && self.sideEffect();
        // Expected: false, and sideEffect() is not executed
        dump(r);
    }
}
