contract Test5 {
    int1: Int;
    int2: Int as int8;
    int3: Int as uint8;
    int4: Int as int64;
    int5: Int as uint64;
    flag: Bool;

    init() {
        self.int1 = 1;
        self.int2 = -2;
        self.int3 = 3;
        self.int4 = 4;
        self.int5 = 5;
        self.flag = true;
    }
}
