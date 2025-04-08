contract SerializedInts {
    int8: Int as int8;
    uint8: Int as uint8;
    int16: Int as int16;
    uint16: Int as uint16;
    int32: Int as int32;
    uint32: Int as uint32;

    init() {
        self.int8 = 0;
        self.uint8 = 0;
        self.int16 = 0;
        self.uint16 = 0;
        self.int32 = 0;
        self.uint32 = 0;
    }
}