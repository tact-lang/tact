// Test 1: Valid usage of wildcard in function parameter (discard parameter) in a non-receiver function
// Expect: Successful compilation if discard usage is allowed
contract Test {
    fun foo(_: Int): Int { return 1; }
    receive() { self.foo(10); }
}
