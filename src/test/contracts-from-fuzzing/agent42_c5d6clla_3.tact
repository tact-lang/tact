contract Test {
    // Receiver for arbitrary text messages using String parameter
    receive(m: String) {
        // Simply use the string
        m;
    }
}
