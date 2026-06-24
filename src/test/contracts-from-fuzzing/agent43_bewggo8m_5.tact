contract TestContract {
    val1: Int as int8 = -1;
    val2: Int as uint8 = 255;
    val3: Int as int16 = -32000;
    val4: Int as uint16 = 65000;
    val5: Int as int32 = -2000000000;
    val6: Int as uint32 = 4000000000;

    init() {
        self.val1 = 0;
        self.val2 = 0;
        self.val3 = 0;
        self.val4 = 0;
        self.val5 = 0;
        self.val6 = 0;
    }
}