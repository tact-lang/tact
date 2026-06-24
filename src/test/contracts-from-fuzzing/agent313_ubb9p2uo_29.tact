contract DiffSerializedInts {
    a: Int as int64 = -100;
    b: Int as uint4 = 12;
    c: Int = 9999;

    init() {
        self.a = -55;
        self.b = 7;
        self.c = 123456;
    }
}