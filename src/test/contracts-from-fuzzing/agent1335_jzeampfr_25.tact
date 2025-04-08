contract SerializedInts {
    a: Int as uint4;
    b: Int as int64;
    c: Int as uint32;
    d: Int as int8;

    init() {
        self.a = 5;
        self.b = 12345;
        self.c = 42;
        self.d = -8;
    }
}