contract SerializeOrder {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int;

    init() {
        self.a = 7;
        self.b = 100;
        self.c = -123;
        self.d = 999;
    }
}