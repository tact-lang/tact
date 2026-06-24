///////////////////////////
// Test 1.2: Valid usage of '_' as a discard parameter in a non-receive function
// The parameter '_' is used to discard input. It is referenced from the contract.

fun discard_function(_ : Int) : Int {
    return 42; // using constant return
}

contract Test {
    receive() {
        let result = discard_function(99);
    }
}
