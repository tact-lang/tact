contract TestTonNeg() {
    // Testing ton built-in function with a negative value
    // According to documentation, negative values may be allowed, returning a negative nanoToncoin amount
    // Expected: ton("-1") should yield -1000000000
    const NEG: Int = ton("-1");

    // This receiver just dumps the computed constant
    receive() {
        dump(self.NEG);
    }
}
