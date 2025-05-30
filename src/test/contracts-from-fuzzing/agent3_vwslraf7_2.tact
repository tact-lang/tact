trait MyTrait {
    // Abstract function: must be overridden
    abstract fun trust(x: Int): Int;

    // Virtual function: can be overridden
    virtual fun verify(x: Int): Int {
         return x * 2;
    }

    // Trait-level constants
    // Abstract constant: must be provided by the inheriting contract
    abstract const A: Int;
    // Virtual constant: default value provided, can be overridden
    virtual const B: Int = 10;
}

contract MyContract(x: Int) with MyTrait {
    // Override the abstract function
    override fun trust(x: Int): Int {
       return x + self.A;
    }

    // Optionally override the virtual function
    override fun verify(x: Int): Int {
       return x + self.B;
    }

    // Override the abstract constant
    override const A: Int = 5;

    // Override the virtual constant to test override
    override const B: Int = 20;

    receive() {
         // The constructor parameter 'x' is accessible via self.x
         let t = self.trust(self.x);  // Expect: self.x + 5
         let v = self.verify(self.x); // Expect: self.x + 20
         dump(t + v);
         cashback(sender());
    }
}
