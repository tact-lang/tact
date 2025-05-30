contract Test {
    // Test 3: Arbitrary text message receiver using String parameter
    receive(str: String) {
        // This receiver should catch any textual message not matching other specific text receivers
    }
}
