contract NegativeInUint {
    a: Int as uint8;

    init() {
        self.a = -1; // negative value for unsigned
    }
}
