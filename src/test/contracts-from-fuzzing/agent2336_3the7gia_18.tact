contract SerializeTrick {
    tiny: Int as uint1;
    small: Int as uint2;
    mid: Int as uint128;
    big: Int as int257;

    init() {
        self.tiny = 1;
        self.small = 2;
        self.mid = 123456789;
        self.big = -987654321;
    }
}