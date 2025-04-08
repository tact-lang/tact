contract SerializedInts {
    tiny: Int as uint4;
    mid: Int as int16;
    big: Int as uint128;
    huge: Int;

    init() {
        self.tiny = 8;
        self.mid = -1000;
        self.big = 12345678901234567890;
        self.huge = -999999999999999999999999;
    }

    receive() {}
}