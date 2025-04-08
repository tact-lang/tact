contract ManyInts {
    int1: Int as int8;
    int2: Int as int16;
    int3: Int as int32;
    int4: Int as int64;
    int5: Int as int128;
    int6: Int as int257;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.int4 = 4;
        self.int5 = 5;
        self.int6 = 6;
    }
}