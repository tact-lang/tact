contract IntSerialization {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}