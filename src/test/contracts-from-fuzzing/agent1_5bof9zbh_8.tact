contract DeRanged {
    // Persistent state variable with constrained range
    var: Int as uint8;

    init() {
        self.var = -1;  // intermediate assignment out-of-range
        self.var = 500; // final assignment out-of-range, will cause exit code 5 at runtime
    }
}
