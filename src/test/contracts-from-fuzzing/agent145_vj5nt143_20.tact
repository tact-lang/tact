contract SerializeSizes {
    small: Int as int4;
    mid: Int as uint16;
    big: Int as int64;

    init() {
        self.small = 3;
        self.mid = 1000;
        self.big = 100000;
    }
}
