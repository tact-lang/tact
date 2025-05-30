contract VariantSerialization {
    val1: Int as uint4;
    val2: Int as uint8;
    val3: Int as uint16;
    val4: Int as uint32;
    val5: Int as int32;
    val6: Int as uint64;
    val7: Int as int64;
    val8: Int as uint256;
    
    init() {
        self.val1 = 1;
        self.val2 = 2;
        self.val3 = 3;
        self.val4 = 4;
        self.val5 = 5;
        self.val6 = 6;
        self.val7 = 7;
        self.val8 = 8;
    }
}
