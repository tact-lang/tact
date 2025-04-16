contract Test123 {
    int1: Int;
    int2: Int as int1;
    int3: Int as int8;
    int4: Int as int64;
    int5: Int as int256;

    init() {
        self.int1 = 0;
        self.int2 = 1;
        self.int3 = -5;
        self.int4 = 12345678;
        self.int5 = -999999;
    }
}