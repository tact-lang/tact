message UniverseCalls {}

contract TestUnderscore {
    state: Int = 0;
    
    // Using underscore to discard the parameter
    receive(_: UniverseCalls) {
        self.state = 123;
    }

    // Dummy receiver for empty messages
    receive() {}
}
