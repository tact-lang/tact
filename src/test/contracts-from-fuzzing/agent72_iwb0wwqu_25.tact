contract IntSerialization {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int;

    init() {
        self.a = 1;
        self.b = 1000;
        self.c = -5;
        self.d = 999999999;
    }
}