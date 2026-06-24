contract EdgeNumericSerialization {
    small: Int as uint1; // 1 bit
    big: Int as int257;  // 257 bits

    init() {
        self.small = 1;
        self.big = 123456789012345678901234567890;
    }
}