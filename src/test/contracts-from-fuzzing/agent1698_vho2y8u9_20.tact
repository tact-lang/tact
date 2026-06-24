contract MixedSerializationsFixed {
    tiny: Int as uint3;
    small: Int as uint8;
    medium: Int as int64;
    large: Int as uint256;
    huge: Int; // default int257

    init() {
        self.tiny = 7;
        self.small = 250;
        self.medium = -123456789;
        self.large = pow(2,200);
        self.huge = pow(2,250);
    }
}