contract TestContract {
    minBit: Int as int1;
    maxBit: Int as int257;

    init() {
        self.minBit = 1;
        self.maxBit = -123456789;
    }
}