contract OutOfRangeSerialized {
    num: Int as uint4; // 0..15

    init() {
        self.num = 42;  // Out of range (expect runtime integer mismatch, exit code 5)
    }
}