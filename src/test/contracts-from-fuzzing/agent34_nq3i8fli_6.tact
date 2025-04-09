contract TestTonHalf() {
    receive() {
        // 1 Toncoin = 1000000000 nanoToncoin, so 0.5 Toncoin should equal 500000000
        dump(ton("0.5"));
    }
}
