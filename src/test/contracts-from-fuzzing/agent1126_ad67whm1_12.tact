contract SerializeWidths {
    small: Int as uint4;
    large: Int as int64;
    huge: Int;

    init() {
        self.small = 7;
        self.large = 5000000;
        self.huge = -10000;
    }
}