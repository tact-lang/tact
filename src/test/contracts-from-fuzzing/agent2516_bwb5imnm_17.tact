contract Serialization {
    tiny: Int as uint4;
    small: Int as int8;
    medium: Int as uint16;
    big: Int as int64;
    huge: Int;

    init() {
        self.tiny = 3;
        self.small = -5;
        self.medium = 1024;
        self.big = -5000000;
        self.huge = 123456789012345;
    }
}