contract EdgeIntSerialized {
    small: Int as int1 = 0;
    tinyU: Int as uint1 = 1;
    huge: Int as int257 = 42;
    maxU: Int as uint256 = 100;
    negBig: Int as int128 = -100;

    init() {
        self.small = 1;
        self.tinyU = 0;
        self.huge = -42;
        self.maxU = 255;
        self.negBig = -99;
    }
}
