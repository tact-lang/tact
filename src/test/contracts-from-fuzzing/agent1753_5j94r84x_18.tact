contract SerializeFormats {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int256;
    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}
