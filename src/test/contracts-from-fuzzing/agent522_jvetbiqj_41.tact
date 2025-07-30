contract ContractWithIntFormats {
    sint8: Int as int8;
    sint16: Int as int16;
    sint256: Int as int256;

    init() {
        self.sint8 = -5;
        self.sint16 = -200;
        self.sint256 = -123456789;
    }
}