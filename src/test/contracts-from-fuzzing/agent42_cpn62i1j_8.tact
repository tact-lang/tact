contract TestTon05 {
    receive() {
        // Testing the constant evaluation of ton("0.5")
        // Expected value: 0.5 * 10^9 = 500000000 nanoToncoins
        dump(ton("0.5"));
        return;
    }
}
