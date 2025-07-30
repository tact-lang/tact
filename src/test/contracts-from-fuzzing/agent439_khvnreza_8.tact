contract Test8 {
    a1: Int as uint4;
    a2: Int as uint8;
    a3: Int as int16;
    a4: Int as uint32;
    a5: Int as int64;
    a6: Int as uint128;
    a7: Int as int257;

    init() {
        self.a1 = 0;
        self.a2 = 0;
        self.a3 = 0;
        self.a4 = 0;
        self.a5 = 0;
        self.a6 = 0;
        self.a7 = 0;
    }

    receive() {}
}