// Test 1: Global constant with computed arithmetic expression
const SUM: Int = 40 + 2;

contract TestSum {
    receive() {
        if (SUM == 42) {
            // Constant arithmetic evaluated correctly
        }
    }
}
