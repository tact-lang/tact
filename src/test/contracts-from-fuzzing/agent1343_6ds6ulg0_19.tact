contract SerializeInts {
    small: Int as uint8;
    mid: Int as int16;
    big: Int as uint64;

    init() {
        self.small=10;
        self.mid=1000;
        self.big=1000000;
    }
}
