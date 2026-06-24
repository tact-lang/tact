contract LargestInts {
    tiny: Int as int1;
    big: Int as int257;
    unsignedMax: Int as uint256;

    init() {
        self.tiny = 0;
        self.big = 0;
        self.unsignedMax = 0;
    }
}
