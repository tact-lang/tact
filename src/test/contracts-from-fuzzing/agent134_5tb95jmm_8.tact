contract TestUnderscore {
    last: String = "";
    
    // Receiver with underscore as a parameter name
    receive(_ : String) {
        self.last = "discard test";
    }
}
