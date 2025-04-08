contract SerialOrder {
    first: Int as uint8;
    second: Int as int16;
    third: Int as uint32;
    fourth: Int as int64;
    fifth: Int as coins;

    init() {
        self.first = 255;
        self.second = -32768;
        self.third = 4294967295;
        self.fourth = -9223372036854775808;
        self.fifth = ton("1");
    }
}