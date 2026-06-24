contract ManySerializationFormats {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Int as int128;
    e: Int as uint256;

    init() {
        self.a = 1;
        self.b = -123;
        self.c = 50000;
        self.d = -999999;
        self.e = 1 << 255;
    }
}