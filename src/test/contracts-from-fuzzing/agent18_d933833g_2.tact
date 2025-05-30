contract TestTon() {
    // Expectation: ton("0.5") computes 0.5 Toncoin, which is 500000000 nanoToncoin
    get fun test(): Int {
         return ton("0.5");
    }
}
