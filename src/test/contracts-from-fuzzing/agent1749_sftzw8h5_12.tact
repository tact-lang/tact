contract DefaultSerialization {
    small: Int as uint8;
    medium: Int as int16;
    big: Int;

    init() {
        self.small = 5;
        self.medium = 256;
        self.big = 1000000;
    }
}