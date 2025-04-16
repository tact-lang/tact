contract Test {
    // Test: Receiver with parameter labeled as 'msg' but with type String. According to docs, arbitrary text messages should be received with parameter name 'str', but the parameter name might not matter. Let's see if this compiles.
    receive(msg: String) {
        // Body intentionally empty
    }
}
