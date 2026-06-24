contract MixSerializations {
    a: Int as int1;
    b: Int as int257;
    c: Int as uint4;
    d: Int as uint64;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}