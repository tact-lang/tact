contract TestContract {
    int1: Int;
    int2: Int as uint8;
    int3: Int as uint256;
    int4: Int as int16;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.int4 = 4;
    }
}
