contract SerializationMixedWidth {
    small: Int as int8 = -10;
    mid: Int as uint32 = 42;
    big: Int = 12345678901234567890;

    init() {
        self.small = 100;
        self.mid = 100000;
        self.big = -1234567890;
    }

    receive() {}
}