contract IntSerialization {
    tiny: Int as uint4;
    small: Int as int8;
    med: Int as uint16;
    big: Int as int64;

    init() {
        self.tiny = 7;
        self.small = -8;
        self.med = 65535;
        self.big = 1_000_000;
    }
}