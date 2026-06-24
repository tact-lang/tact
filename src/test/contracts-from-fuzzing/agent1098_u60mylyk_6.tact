contract ManyFieldsSized {
    int4: Int as uint4;
    int12: Int as int12;
    int64: Int as int64;
    int128: Int as int128;
    int250: Int as int250;
    bool1: Bool;
    str: String;

    init() {
        self.int4 = 5;
        self.int12 = -50;
        self.int64 = 123456789;
        self.int128 = 12345678901234567890;
        self.int250 = 1 << 249;
        self.bool1 = false;
        self.str = "hello";
    }
}
