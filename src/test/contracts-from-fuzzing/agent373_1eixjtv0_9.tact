contract EdgeInts {
    small: Int as uint4;    // 0..15
    medium: Int as int8;   // -128..127
    large: Int as uint64;  // 0..2^64-1
    
    init() {
        self.small = 15;
        self.medium = -128;
        self.large = 1000000000000;
    }
}