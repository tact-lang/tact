const HALF_TON: Int = ton("0.5");

contract TestHalfTon() {
    get fun getHalfTon(): Int {
        // Expected: 0.5 Toncoin = 500,000,000 nanoToncoins
        return HALF_TON;
    }
}
