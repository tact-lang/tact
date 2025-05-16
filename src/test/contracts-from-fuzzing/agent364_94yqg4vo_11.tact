contract SerializationTest {
    small: Int as uint4;      // 4 bits
    neg: Int as int8;         // 8 bits signed
    long: Int as uint64;      // 64 bits
    big: Int;                 // default 257 bits
    flag: Bool;               // 1 bit

    init() {
        self.small = 5;
        self.neg = -7;
        self.long = 123456789;
        self.big = 1 << 200;
        self.flag = true;
    }
}