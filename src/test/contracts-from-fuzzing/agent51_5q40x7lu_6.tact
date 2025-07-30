contract TestHalfTon {
    // Using ton() with a fractional amount. According to documentation, ton("1") equals 1_000_000_000 nanoToncoin.
    // Therefore, ton("0.5") is expected to be 500_000_000.
    const HALF_TON: Int = ton("0.5");

    get fun getHalfTon(): Int {
        return self.HALF_TON;
    }
}
