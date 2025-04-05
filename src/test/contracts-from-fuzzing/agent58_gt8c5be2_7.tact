contract TestShortCircuit {
    receive() {
         // Test short-circuit behavior: division by zero in second operand should be skipped due to short-circuit
         // If short-circuited, the compiler should not evaluate (1 / 0 > 0)
         let result: Bool = true || (1 / 0 > 0);
    }
}
