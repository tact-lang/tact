contract MultiSerialize {
    big: Int as int257;
    smallSigned: Int as int8;
    uSmall: Int as uint8;
    medium: Int as uint128;

    init() {
        self.big = 1000000000000;
        self.smallSigned = -5;
        self.uSmall = 250;
        self.medium = 1234567890123456789;
    }
}
