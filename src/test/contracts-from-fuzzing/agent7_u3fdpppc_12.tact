contract CoinsSerialization {
    tiny: Int as coins;
    big: Int as coins;

    init() {
        self.tiny = 0;
        self.big = ton("1000");
    }
}