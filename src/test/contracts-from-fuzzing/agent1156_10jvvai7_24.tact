contract MultiSerializationFormats {
    a: Int as int64;
    b: Int as uint4;
    c: Int as uint32;
    d: Int as coins;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}