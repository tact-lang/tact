contract SerializedInts {
    small: Int as uint8;     // 0..255 unsigned
    medium: Int as int16;   // -32768 .. 32767
    large: Int as uint128;  // 0..2^128-1

    init() {
        self.small = 5;
        self.medium = 200;
        self.large = 123456789012345;
    }
}