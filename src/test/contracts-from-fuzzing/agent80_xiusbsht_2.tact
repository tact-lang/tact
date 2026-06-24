contract Test {
    // Test for a receiver that matches a specific comment string "greeting".
    receive("greeting") {
        // This receiver should only trigger when the incoming message is exactly "greeting".
    }
}
