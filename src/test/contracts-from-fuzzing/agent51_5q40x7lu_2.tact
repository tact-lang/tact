contract TestTon {
    // Using the built-in compile-time function ton() to convert a string representation of Toncoin.
    // Expected: ton("1") evaluates to 1,000,000,000 nanoToncoin.
    const ONE_TON: Int = ton("1");

    // Getter function to use the constant, ensuring the constant is actually compiled.
    get fun getTon(): Int {
         return self.ONE_TON;
    }
}
