contract TestFunctionChain {
    // A simple function that increments its argument
    fun inc(x: Int): Int {
        return x + 1;
    }

    receive() {
        // Simple function call using self
        let a: Int = self.inc(5);
        // Chained function call: self.inc(self.inc(3)) should result in 5
        let b: Int = self.inc(self.inc(3));
    }
}
