contract TestTon() {
    // Constant evaluation: ton("0.5") should yield 500000000 nanoToncoin
    const halfTon: Int = ton("0.5");

    // Getter to expose the value for testing
    get fun getHalfTon() : Int {
         return self.halfTon;
    }
}
