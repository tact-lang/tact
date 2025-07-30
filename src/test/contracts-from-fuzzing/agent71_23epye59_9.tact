contract SerializationWidths {
    int4: Int as uint4;
    int8: Int as int8;
    int32: Int as uint32;
    int64: Int as int64;
    int128: Int as uint128;
    int257: Int as int257;

    init() {
        self.int4 = 1;
        self.int8 = 2;
        self.int32 = 3;
        self.int64 = 4;
        self.int128 = 5;
        self.int257 = 6;
    }
}