contract Test {
    // Arbitrary text message receiver
    receive(str: String) {
        // handle arbitrary text messages
    }

    // Dummy function to force compilation
    get fun test(): Int {
        return 10;
    }
}