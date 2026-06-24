contract SerializeOrder {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}