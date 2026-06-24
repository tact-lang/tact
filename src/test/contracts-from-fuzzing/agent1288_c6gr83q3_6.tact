contract TestContract {
    int1: Int;
    int2: Int as uint8;
    int3: Int as int32;
    int4: Int as uint64;
    int5: Int as int257;

    init() {
        self.int1 = 42;
        self.int2 = 255;
        self.int3 = -1000;
        self.int4 = 10000000;
        self.int5 = -1234567890123456789;
    }
}
