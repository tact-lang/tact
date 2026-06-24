contract TestConstArithmetic() {
    // Evaluate constant arithmetic with compile-time built-in functions
    // ton("1") returns 1000000000, so X should be 2000000000
    const X: Int = ton("1") + ton("1");
    
    receive() {
        dump(self.X); // expected output: 2000000000
        cashback(sender());
    }
}
