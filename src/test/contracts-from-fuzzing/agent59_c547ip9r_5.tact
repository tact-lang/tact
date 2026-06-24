contract TestTonHalf() {
    fun test() {
        dump(TON_HALF);
    }
}

// Evaluating ton("0.5") at compile-time
// Expected: 500000000, since 1 Toncoin = 1000000000 nanoToncoins
const TON_HALF: Int = ton("0.5");