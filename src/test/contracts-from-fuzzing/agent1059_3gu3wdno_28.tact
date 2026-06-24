contract OutOfOrderSerialization {
    a: Int as uint32;
    b: Int as uint4;
    c: Int as int257;

    init() {
        self.a = 12;
        self.b = 3;
        self.c = -5;
    }
}