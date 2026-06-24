contract DifferentSizedInts {
    a: Int as uint3 = 5;
    b: Int as int8 = -8;
    c: Int as int64 = 123456789;

    init() {
        self.a = 7;
        self.b = 8;
        self.c = -987654321;
    }

    receive() {}
}