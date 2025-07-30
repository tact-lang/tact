contract Serials {
    tiny: Int as uint4;
    small: Int as uint8;
    med: Int as uint32;
    large: Int as int256;
    flag: Bool;

    init() {
        self.tiny = 3;
        self.small = 200;
        self.med = 100000;
        self.large = -123456789012345;
        self.flag = true;
    }
}
