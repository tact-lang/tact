contract IntSerialization {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint32;
    d: Int;

    init() {
        self.a = 5;
        self.b = -50;
        self.c = 123456;
        self.d = -500;
    }
}