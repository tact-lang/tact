contract IntFieldSerializations {
    plain: Int;
    ten_bit: Int as uint10;
    signed100: Int as int100;
    default_zero: Int = 0;
    init() {
        self.plain = 1000;
        self.ten_bit = 10;
        self.signed100 = -50;
        self.default_zero = 42;
    }
}