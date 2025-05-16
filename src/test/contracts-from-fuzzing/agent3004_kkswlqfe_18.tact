contract ExplicitSerialization {
    small: Int as uint8;
    big: Int as int257;

    init() {
        self.small = 12;
        self.big = 1000000000000000000;
    }
}