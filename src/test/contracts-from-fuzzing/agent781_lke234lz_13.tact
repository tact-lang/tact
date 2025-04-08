contract MixSerialization {
    small: Int as uint4 = 7;
    middle: Int as int16 = 1234;
    large: Int = 9999999;

    init() {
        self.small = 8;
        self.middle = -1234;
        self.large = -9999999;
    }
}