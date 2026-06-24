contract SerializationEdges {
    tinyInt: Int as int1 = 0;        // 1-bit signed int: only supports -1, 0
    smallUint: Int as uint1 = 1;     // 1-bit unsigned int: only supports 0,1
    maxInt: Int as int257 = 123;     // 257 bits
    maxUint: Int as uint256 = 456;   // 256 bits

    init() {
        self.tinyInt = -1;
        self.smallUint = 0;
        self.maxInt = 0;
        self.maxUint = 0;
    }
}