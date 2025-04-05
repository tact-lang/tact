// Test 1: Optional Valid Usage
// This test validates that an optional variable can be assigned and correctly accessed using the non-null assertion operator.

contract TestOptionalValid {
    fun run() {
       let x: Int? = null;
       x = 42;
       // Should dump 42
       dump(x!!);
    }
}
