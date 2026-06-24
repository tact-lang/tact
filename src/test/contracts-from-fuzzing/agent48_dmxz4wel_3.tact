// Test 1: Using wildcard '_' as a function parameter in a non-receive function.
// Expect: Rejected, because '_' is not allowed as a valid identifier outside discard contexts.
fun f(_ : Int): Int {
    return 42;
}

contract Test {
    receive() {
        let x = f(10);
    }
}
