///////////////////////////////
// Test 5: Using wildcard '_' as a local variable name in let binding
// Expected: Compilation error - '_' is reserved for discarding values and not allowed as a variable identifier

contract Test {
    receive() {
        let _ = 5;
    }
}
