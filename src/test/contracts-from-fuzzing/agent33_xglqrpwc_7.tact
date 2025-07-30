trait T1 {
    // Abstract function: must be overridden by the implementing contract
    abstract fun f(x: Int): Int;
}

trait T2 {
    // Virtual function with a default implementation
    virtual fun g(x: Int): Int {
         return x + 10;
    }
}

contract C(a: Int) with T1, T2 {
    // Override the abstract function from T1, using the contract parameter 'a'
    override fun f(x: Int): Int {
         return x + self.a;
    }
    
    // Helper function to test trait interaction: returns f(5) + g(5)
    fun run(): Int {
         let r1 = self.f(5);  // expected: 5 + self.a
         let r2 = self.g(5);  // expected: 5 + 10 = 15
         return r1 + r2;      // total: self.a + 20
    }
    
    // Receiver function to invoke run() and ensure usage at runtime
    receive() {
         let _ = self.run();
         cashback(sender());
    }
}
