contract IntSerialize {
    small: Int as int8;
    medium: Int as int64;
    big: Int as int256;
    normal: Int;

    init() {
        self.small = -10;
        self.medium = 100000;
        self.big = 10000000000;
        self.normal = 42;
    }
}