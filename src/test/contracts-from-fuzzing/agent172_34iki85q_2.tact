contract MultiTypeStorage {
    int1: Int as int1;
    int8: Int as int8;
    int16: Int as int16;
    int64: Int as int64;
    int257: Int;
    uint4: Int as uint4;
    uint32: Int as uint32;
    uint256: Int as uint256;
    flag: Bool;
    label: String;

    init() {
        self.int1 = 1;
        self.int8 = 127;
        self.int16 = 32000;
        self.int64 = 123456789;
        self.int257 = -999999999;
        self.uint4 = 15;
        self.uint32 = 123456;
        self.uint256 = 7890123456789;
        self.flag = true;
        self.label = "test";
    }
}