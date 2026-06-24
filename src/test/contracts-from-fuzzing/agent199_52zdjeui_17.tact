contract SerializationFormats {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int8;
    d: Int as uint4;
    e: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
    }
}