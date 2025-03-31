contract Test {
    // Arbitrary text message receiver: matches any text message that is not an exact match
    // to a more specific comment receiver
    receive(str: String) { 
        // do nothing
    }
}
