contract Test {
    state: Int = 0;
    
    // Receiver for arbitrary text messages
    receive(str: String) {
        if (str == "text") {
            self.state = 100;
        }
    }
}
