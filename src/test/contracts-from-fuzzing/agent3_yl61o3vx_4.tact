contract ConstTon {
    // Test compile-time evaluation of ton built-in call for non-integer value
    const TENTH: Int = ton("0.1");

    receive() {
         // Validate the constant value at runtime using require()
         require(self.TENTH == 100000000, "ton(\"0.1\") did not evaluate to 100000000");
         cashback(sender());
    }
}
