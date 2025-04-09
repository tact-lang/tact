contract SerializeInts {
    small: Int as uint4;
    big: Int as uint32;

    init() {
        self.small = 9;
        self.big = 255;
    }
}