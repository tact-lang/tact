contract TestArbitraryString {
    // Receiver for arbitrary text messages
    receive(str: String) {
        // do nothing
    }

    // Ensure compiler includes the receiver
    get fun test(): Int {
        return 0;
    }
}
