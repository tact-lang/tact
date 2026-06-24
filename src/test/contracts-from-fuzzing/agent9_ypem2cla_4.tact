contract DeRanged {
    var: Int as uint8;
    
    init() {
        self.var = -1;   // Intermediate assignment out-of-range, but allowed
        self.var = 500;  // Final assignment out-of-range, should cause exit code 5 at runtime
    }
}
