contract SerializeEdge {
    small: Int as uint4;
    large: Int as int256;
    tiny: Int as uint1;
    sign: Int as int1;

    init() {
        self.small = 15;
        self.large = 100;
        self.tiny = 1;
        self.sign = -1;
    }
}
