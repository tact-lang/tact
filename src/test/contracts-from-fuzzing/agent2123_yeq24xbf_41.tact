contract SerializationContracts {
    big: Int;
    medium: Int as int64;
    small: Int as uint8;

    init() {
        self.big = 123456789;
        self.medium = 12345;
        self.small = 255;
    }
}