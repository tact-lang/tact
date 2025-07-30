contract Test7 {
    int1: Int;
    int2: Int as uint4;
    int3: Int as uint8;
    int4: Int as int32;
    int5: Int as uint64;
    int6: Int as int128;
    int7: Int as uint256;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.int4 = 4;
        self.int5 = 5;
        self.int6 = 6;
        self.int7 = 7;
    }
}