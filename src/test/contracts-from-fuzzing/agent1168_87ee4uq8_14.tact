contract SerializeInts {
    small: Int as uint8;
    mid: Int as int64;
    big: Int;

    init() {
        self.small = 5;
        self.mid = -123456789;
        self.big = 987654321;
    }
}