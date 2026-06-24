contract SerializeBits {
    small: Int as uint4;
    big: Int as int257;

    init() {
        self.small = 9;
        self.big = -1234567890;
    }
}