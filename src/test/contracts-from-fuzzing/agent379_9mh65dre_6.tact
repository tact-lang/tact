contract MixedWidths {
    int8: Int as int8 = 12;
    uint4: Int as uint4 = 5;
    int16: Int as int16 = -1234;
    uint32: Int as uint32 = 123456;
    int64: Int as int64 = -123456789;

    init() {
        self.uint32 = 999999;
    }
}