contract Test2 {
    // Testing text receiver: this should be triggered only by the message with text "hello"
    receive("hello") {
        // code to handle the matching text message
    }

    // For ensuring the contract is fully compiled, dummy function is added
    get fun dummy(): Int {
        return 42;
    }
}
