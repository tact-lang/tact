contract IntSerializationRange {
    tiny: Int as uint4;
    small: Int as int8;
    mid: Int as uint16;
    wide: Int as int32;
    big: Int;

    init() {
        self.tiny = 4;
        self.small = -8;
        self.mid = 16000;
        self.wide = -1000000;
        self.big = 123456789012345;
    }
}