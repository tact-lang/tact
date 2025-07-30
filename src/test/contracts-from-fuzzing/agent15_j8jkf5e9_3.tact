contract TestContract() {
    // Contract-level constant, evaluated at compile time: ton("1") should yield 1000000000
    const T: Int = ton("1");
    
    fun test() {
        dump(self.T); // Use self.T to refer to the constant
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
