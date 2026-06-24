contract IntSerialization {
    a: Int as coins;
    b: Int as uint4;
    c: Int as int20;

    init() {
        self.a = 50;
        self.b = 7;
        self.c = -3;
    }
}