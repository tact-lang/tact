contract Test {
    // Receiver function with parameter named 'sender'
    // This tests shadowing of the global function sender() by a parameter.
    // Expected: The use of sender() inside the function should refer to the parameter, causing a compile error when used as a function call.
    receive(sender: String) {
        let a = sender;      // refers to the receiver parameter
        let b = sender();    // attempting to call sender() as a function, but 'sender' is a String parameter
    }
}
