contract CoinTest {
    receive() {
        // 1 Toncoin = 1,000,000,000 nanoToncoins
        let oneTon: Int = ton("1");
        let result: Int = oneTon + 1000; // expected: 1e9 + 1000
        dump(result);
        cashback(sender());
    }
}
