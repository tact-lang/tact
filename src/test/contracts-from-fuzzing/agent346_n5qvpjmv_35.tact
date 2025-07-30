contract IntSerialization {
    a: Int as int8;
    b: Int as int16;
    c: Int as uint32;

    init() {
        self.a = 127;
        self.b = 250;
        self.c = 5000;
    }
}