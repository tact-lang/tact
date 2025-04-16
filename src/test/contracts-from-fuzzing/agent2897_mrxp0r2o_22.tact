contract MixSerializationFormats {
    val64: Int as int64;
    val8: Int as uint8;
    valCoins: Int as coins;
    valDefault: Int;
    init() {
        self.val64 = -1000;
        self.val8 = 255;
        self.valCoins = 5000000000;  // 5 TON
        self.valDefault = 42;
    }
}