contract ConstantTest() {
    // Compile-time constant evaluated using the built-in function ton.
    // According to documentation, one Toncoin = 1_000_000_000 nanoToncoin.
    const oneTon: Int = ton("1");

    // This function returns the value computed at compile-time by the ton("1") function,
    // accessed via self.oneTon, since contract-level constants are available via self.
    fun getTon(): Int {
        return self.oneTon;
    }

    // Dummy receive to ensure the contract is fully compiled.
    receive() {}
}
