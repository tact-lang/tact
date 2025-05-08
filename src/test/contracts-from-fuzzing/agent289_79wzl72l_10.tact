contract SerializedFieldFormats {
    a: Int as int64;
    b: Int as uint8;
    c: Int as uint256;
    d: Int;
    flag: Bool;

    init() {
        self.a = 123;
        self.b = 255;
        self.c = 9999999;
        self.d = -42;
        self.flag = true;
    }
}