contract OverflowUint {
    a: Int as uint8;

    init() {
        self.a = 256; // over uint8 max
    }
}
