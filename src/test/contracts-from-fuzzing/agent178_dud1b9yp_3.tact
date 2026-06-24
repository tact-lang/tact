contract Test {
    state: String = "none";
    
    // Receiver for arbitrary text messages
    receive(str: String) {
        self.state = str;
    }

    // Dummy function to ensure deployment
    receive() {}
}
