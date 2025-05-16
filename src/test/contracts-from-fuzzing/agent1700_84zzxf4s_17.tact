contract SerializationExamples {
    tiny: Int as uint3;
    small: Int as int8;
    large: Int as uint256;

    init() {
        self.tiny = 7;    // Max for 3 bits unsigned
        self.small = -128; // Min for int8
        self.large = 115792089237316195423570985008687907853269984665640564039457584007913129639935; // 2^256 - 1
    }
}
