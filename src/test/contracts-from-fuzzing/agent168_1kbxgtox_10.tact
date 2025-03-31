contract Test {
    // Multiple receivers: specific text vs arbitrary text
    // According to documentation, message with comment "abc" should be handled by the specific receiver
    receive("abc") {
        // specific text message receiver, matches only "abc"
    }

    receive(str: String) {
        // arbitrary text message receiver, matches any text message except ones handled by specific receiver
    }
}
