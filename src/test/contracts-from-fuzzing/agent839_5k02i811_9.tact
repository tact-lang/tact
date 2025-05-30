contract BitSized {
    small: Int as uint4;
    mid: Int as uint8;
    big: Int as uint128;
    init() {
        self.small = 7;
        self.mid = 100;
        self.big = 100000;
    }
}