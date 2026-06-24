contract IntsOfVariousSizes {
    n1: Int as int8;
    n2: Int as int16;
    n3: Int as int32;
    n4: Int as int64;
    n5: Int as int128;
    n6: Int as uint8;
    n7: Int as uint16;
    n8: Int as uint32;
    n9: Int as uint64;
    n10: Int as uint128;

    init() {
        self.n1 = 1;
        self.n2 = 2;
        self.n3 = 3;
        self.n4 = 4;
        self.n5 = 5;
        self.n6 = 6;
        self.n7 = 7;
        self.n8 = 8;
        self.n9 = 9;
        self.n10 = 10;
    }
}