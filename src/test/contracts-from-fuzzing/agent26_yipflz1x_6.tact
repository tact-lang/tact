trait SimpleTrait {
    // abstract function: must be overridden
    abstract fun abstractF(x: Int): Int;

    // virtual function with default implementation
    virtual fun virtualF(x: Int): Int {
         return x + 1;
    }

    // abstract constant: must be overridden
    abstract const A: Int;

    // virtual constant: can be optionally overridden
    virtual const B: Int = 10;
}

contract Concrete(initVal: Int) with SimpleTrait {
    // Override the abstract function
    override fun abstractF(x: Int): Int {
         return x * 2;
    }

    // Override the virtual function
    override fun virtualF(x: Int): Int {
         return x + 2;
    }

    // Override the abstract constant
    override const A: Int = 5;

    // Override the virtual constant
    override const B: Int = 20;

    receive() {
         let r = self.test(self.initVal);
         cashback(sender());
    }

    get fun test(x: Int): Int {
         return self.abstractF(x) + self.virtualF(x) + self.A + self.B;
    }
}
