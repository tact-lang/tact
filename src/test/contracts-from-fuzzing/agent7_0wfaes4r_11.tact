// Test 11: Using '_' as a standalone discarded let binding variable
fun f(): Int {
    let _ : Int = 123; // '_' is declared to discard its value
    return 456;
}

contract Test {
    receive() {
         dump(f()); // Should output 456
    }
}
