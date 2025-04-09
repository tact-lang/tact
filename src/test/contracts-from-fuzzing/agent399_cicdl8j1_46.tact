contract IntSerializationSizes {
    a: Int as int8;
    b: Int as int16;
    c: Int as uint4;
    d: Int as uint32;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}