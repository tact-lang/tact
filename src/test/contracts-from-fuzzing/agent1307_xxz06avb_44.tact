contract IntSerializations {
    tiny: Int as uint3 = 1;
    small: Int as uint8 = 255;
    mid: Int as int16 = -32768;
    big: Int as uint64 = 1000000;

    init() {
        self.tiny = 7;
        self.small = 200;
        self.mid = 32000;
        self.big = 123456789;
    }
}