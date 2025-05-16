contract Serializations {
    small: Int as uint4;
    mid: Int as uint32;
    large: Int as int257;

    init() {
        self.small = 5;
        self.mid = 500000;
        self.large = -123456789123456789;
    }
}
