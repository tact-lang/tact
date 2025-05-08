contract TestTon() {
    // Getter returning the computed ton value of "1", where 1 Toncoin = 1,000,000,000 nanoToncoins
    // Expected value: 1000000000
    get fun value() : Int {
        return ton("1");
    }
}
