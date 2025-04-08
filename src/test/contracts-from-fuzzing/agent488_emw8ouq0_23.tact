contract MultipleSerializationFormats {
    a: Int as int1;
    b: Int as int16;
    c: Int as uint5;
    d: Int as uint64;
    e: Int; // full 257-bit signed

    init() {
        self.a = 1;
        self.b = 100;
        self.c = 10;
        self.d = 123456;
        self.e = 777;
    }
}