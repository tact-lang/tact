contract TestIntermediateRange {
    var: Int as uint8 = 0;

    init() {
        // Intermediate assignment out-of-range, but final assignment in range
        self.var = 300;  // 300 is out-of-range for uint8 (allowed 0-255) but will be overwritten
        self.var = 42;   // Final value in range
    }

    receive() {
        dump(self.var); // Expected output: 42
    }
}
