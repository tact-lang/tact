contract TestTonConstant() {
    // Testing the compile-time evaluation of the ton built-in function
    // According to documentation: 1 Toncoin = 1_000_000_000 nanoToncoins
    const TONCOIN: Int = ton("1");
    
    receive() {
        dump(self.TONCOIN); // Expect to dump 1000000000
    }
}
