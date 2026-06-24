contract TestTonHalf {
    // Contract-level constant evaluating ton built-in compile-time function for fractional value.
    // According to documentation, ton("0.5") should convert 0.5 Toncoin into 500,000,000 nanoToncoin.
    const HALF: Int = ton("0.5");
    
    receive() {
        require(self.HALF == 500000000, "Incorrect ton(0.5) constant evaluation");
        cashback(sender());
    }
}
