// Test 1: Valid usage - Using _ in function parameters for discarding values
fun validDiscard(_: Int): Int { return 123; }

contract C1 {
    receive() {
        validDiscard(42);
    }
}
