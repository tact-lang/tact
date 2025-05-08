contract MixedSizes {
    big: Int;
    small1: Int as uint8;
    small2: Int as uint16;
    tinyBool: Bool;

    init() {
        self.big = 12345678901234567890;
        self.small1 = 200;
        self.small2 = 65535;
        self.tinyBool = true;
    }
}