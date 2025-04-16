contract DeRanged1 {
    // Persistent state variable: uint8 range [0,255]
    var: Int as uint8;

    init() {
        // Intermediate out-of-range assignment
        self.var = 500; // This should not trigger an error immediately
        // Final assignment in-range
        self.var = 42;
    }
}
