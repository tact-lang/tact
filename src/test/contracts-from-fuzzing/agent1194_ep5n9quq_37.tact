contract IntSerialization {
    a: Int as uint4;
    b: Int as coins;
    c: Int as int257;

    init() {
        self.a = 7;
        self.b = ton("1");
        self.c = -123456789;
    }
}