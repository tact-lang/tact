contract IntSerializations {
    int8val: Int as int8;
    uint8val: Int as uint8;
    int64val: Int as int64;
    uint64val: Int as uint64;

    init() {
        self.int8val = 127;
        self.uint8val = 255;
        self.int64val = 2;
        self.uint64val = 3;
    }
}