contract VariousSerializations {
    valInt64: Int as int64;
    valUInt8: Int as uint8;
    valUInt256: Int as uint256;
    valInt: Int;

    init() {
        self.valInt64 = 1;
        self.valUInt8 = 2;
        self.valUInt256 = 3;
        self.valInt = 4;
    }
}