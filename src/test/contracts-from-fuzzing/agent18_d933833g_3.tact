const testTonCorrect: Int = ton("0.1");

contract TestCorrect {
    // This getter returns a constant value computed at compile-time: 0.1 Toncoin in nanoToncoin
    get fun value(): Int {
         return testTonCorrect; // expected: 100000000 (since 1 Toncoin = 10^9 nanoToncoin, 0.1 Toncoin = 10^8)
    }
}
