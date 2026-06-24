contract IntSerializations {
    ser1: Int as coins;
    ser2: Int as int64;
    ser3: Int as uint32;

    init() {
        self.ser1 = 999999999;
        self.ser2 = -12345678;
        self.ser3 = 12345678;
    }
}
