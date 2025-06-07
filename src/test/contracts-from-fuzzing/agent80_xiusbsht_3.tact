contract Test {
    // Test for an arbitrary text message receiver using String parameter
    receive(str: String) {
        // This receiver should trigger for any textual message not matched by literal receivers
    }
}
