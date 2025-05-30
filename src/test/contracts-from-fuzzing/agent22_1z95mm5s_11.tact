// Test 1: Valid top-level constant and arithmetic evaluation

const ARITH: Int = 10 + 32;

contract Test1 {
    receive() {
         // Using a top-level constant directly
         if (ARITH == 42) { }
    }
}
