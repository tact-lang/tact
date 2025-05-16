contract SerializedInts {
    a: Int as uint8;
    b: Int as int4;
    c: Int as uint248;
    d: Int as int257;

    init() {
        self.a = 10;
        self.b = -3;
        self.c = 123456;
        self.d = 1;
    }
}