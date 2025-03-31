contract Test {
    // Test 16b: Receiver function where parameter name shadows built-in sender (but using it as a string value)
    receive(sender: String) {
        // simply assign the parameter to a local variable to ensure it's handled as a string
        let x: String = sender;
    }

    receive() {
        // empty message receiver to complete the contract
    }
}
