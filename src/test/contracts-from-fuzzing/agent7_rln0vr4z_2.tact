contract TestTon {
    // Contract-level constant evaluating the ton built-in compile-time function.
    // According to documentation, ton("1") converts 1 Toncoin into 1,000,000,000 nanoToncoin.
    const TONVAL: Int = ton("1");
    
    receive() {
        // Use the constant as self.TONVAL
        require(self.TONVAL == 1000000000, "Incorrect ton constant evaluation");
        cashback(sender());
    }
}
