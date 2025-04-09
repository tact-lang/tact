contract TestTon() {
    // This getter returns the result of evaluating the compile-time function ton("1")
    // Expected: 1000000000 nanoToncoins (1 Toncoin)
    get fun getMyTon() : Int {
        return ton("1");
    }
}
