contract SerializedInts {
    small: Int as int8;
    med: Int as int32;
    big: Int as int257;

    init() {
        self.small = 127;
        self.med = 123456;
        self.big = 123456789012345678901234567890;
    }
}
