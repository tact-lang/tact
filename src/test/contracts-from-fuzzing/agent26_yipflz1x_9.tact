trait A {
    // Abstract function and abstract constant
    abstract fun f(x: Int): Int;
    abstract const CA: Int;
}

trait B with A {
    // Provide implementation for function f and constant CA
    override fun f(x: Int): Int {
         return x * 2;
    }
    override const CA: Int = 10;
}

trait C {
    // Additional virtual function and virtual constant
    virtual fun g(x: Int): Int {
        return x + 5;
    }
    virtual const CB: Int = 20;
}

contract D(initVal: Int) with B, C {
    // The contract parameter initVal is accessible as self.initVal
    receive() {
         // Execute the test getter to combine traits' functions and constants
         let r = self.test(self.initVal);
         // r is computed as: f(initVal) + g(initVal) + CA + CB, using implementations from B and C
         cashback(sender());
    }

    get fun test(x: Int): Int {
         return self.f(x) + self.g(x) + self.CA + self.CB;
    }
}
