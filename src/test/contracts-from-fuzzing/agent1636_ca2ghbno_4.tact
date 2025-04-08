contract TestContract {
    int1: Int as uint8;
    int2: Int as int16;
    int3: Int as uint32;
    int4: Int as int257;

    init() {
        self.int1 = 1;
        self.int2 = -2;
        self.int3 = 3;
        self.int4 = -4;
    }
}