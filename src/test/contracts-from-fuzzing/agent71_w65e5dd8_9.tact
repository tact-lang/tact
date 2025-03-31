// Snippet 4: Using '_' as a local variable name (should be rejected)
contract TestVar {
    receive() {
       let _ = 5;
    }
}
