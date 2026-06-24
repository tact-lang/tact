contract SerializedInts {
    small: Int as int8;
    big: Int as int257;
    unsigned: Int as uint64;

    init() {
        self.small = 10;
        self.big = 1000000000;
        self.unsigned = 999999999;
    }
}