contract SerialFormat {
    valInt8: Int as int8;
    valUInt8: Int as uint8;
    valInt16: Int as int16;
    valUInt16: Int as uint16;
    valCoins: Int as coins;

    init() {
        self.valInt8 = 0;
        self.valUInt8 = 0;
        self.valInt16 = 0;
        self.valUInt16 = 0;
        self.valCoins = 0;
    }
}