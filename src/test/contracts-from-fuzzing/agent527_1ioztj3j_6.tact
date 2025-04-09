contract DifferentSerializations {
    intSigned: Int as int64;
    intUnsigned: Int as uint64;
    intCoin: Int as coins;
    flag: Bool;

    init() {
        self.intSigned = -42;
        self.intUnsigned = 42;
        self.intCoin = 1_000_000_000;
        self.flag = true;
    }
}