contract SerializationMix {
    narrow: Int as uint4;
    mid: Int as int16;
    wide: Int as uint256;

    init() {
        self.narrow = 5;
        self.mid = -1234;
        self.wide = 123456789012345678901234567890;
    }
}