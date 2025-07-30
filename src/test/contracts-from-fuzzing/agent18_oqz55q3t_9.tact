// Test 1: Top-level constant usage in contract via self
const GLOBAL: Int = 123;

contract TestGlobal {
    receive() {
        // Correct usage because constant is global
        dump(GLOBAL);
    }
}
