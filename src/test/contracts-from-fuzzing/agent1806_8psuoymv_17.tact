contract SerializeVarSizes {
    big: Int as uint64;
    small: Int as uint4;
    middle: Int as uint16;
    init() {
        self.big = 1000;
        self.small = 7;
        self.middle = 255;
    }
}