contract IntWithSerialization {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int8;

    init() {
        self.a = 123456789;
        self.b = 4000;
        self.c = -100;
    }
}