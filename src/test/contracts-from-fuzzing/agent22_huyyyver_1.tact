const ARITH_RESULT: Int = 1 + 2 * 3;

contract TestArithmetic {
    receive() {
        // Use the compile-time constant in a variable assignment
        let x = ARITH_RESULT; // expected x == 7
        // Simple no-op usage to force evaluation
        x;
    }
}
