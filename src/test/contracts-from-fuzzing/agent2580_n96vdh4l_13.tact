contract IntSerialization {
    a: Int as int64;
    b: Int as uint32;
    c: Int;

    init() {
        self.a = 10;
        self.b = 20;
        self.c = 30;
    }
}