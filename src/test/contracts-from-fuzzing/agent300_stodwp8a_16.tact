contract TestContract {
    signedSmall: Int as int16;
    unsignedTiny: Int as uint8;
    unsignedMax: Int as uint256;

    init() {
        self.signedSmall = -12345;
        self.unsignedTiny = 200;
        self.unsignedMax = 12345678901234567890;
    }
}