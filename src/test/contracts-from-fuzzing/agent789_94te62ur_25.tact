contract OptionalIntSerializations {
    val1: Int? as uint4;
    val2: Int? as uint8;
    val3: Int? as int16;
    val4: Int? as uint32;
    val5: Int? as int64;
    val6: Int? as int257;

    init() {
        self.val1 = null;
        self.val2 = null;
        self.val3 = null;
        self.val4 = null;
        self.val5 = null;
        self.val6 = null;
    }
}
