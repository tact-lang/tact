contract OptionalUintConversions {
    small: Int? as uint32;
    med: Int? as uint64;
    big: Int? as uint256;

    init() {
        self.small = 1;
        self.med = null;
        self.big = null;
    }

    receive() {
        self.small = null;
        self.med = 12345;
    }
}