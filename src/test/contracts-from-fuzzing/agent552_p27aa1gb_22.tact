contract TestContract {
    int1: Int as int8 = 1;
    int2: Int as int16 = -1;
    int3: Int as uint8 = 255;
    int4: Int as uint16 = 65535;
    int5: Int as uint256 = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;

    init() {
        self.int1 = 2;
        self.int2 = -2;
        self.int3 = 254;
        self.int4 = 65534;
        self.int5 = 12345;
    }
}