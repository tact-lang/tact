contract SerializationHints {
    valSigned64: Int as int64;
    valUnsigned32: Int as uint32;
    valCoins: Int as coins;

    init() {
        self.valSigned64 = -1000;
        self.valUnsigned32 = 123456;
        self.valCoins = ton("1");
    }
}