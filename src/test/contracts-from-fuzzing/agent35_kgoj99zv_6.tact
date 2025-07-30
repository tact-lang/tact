trait TestBaseTrait {
    // Abstract function: must be overridden
    abstract fun compute(x: Int): Int;
}

trait TestDerivedTrait with TestBaseTrait {
    // Providing a default implementation for compute
    override fun compute(x: Int): Int {
        return x * 2;
    }
    // Virtual function that can be overridden
    virtual fun computeMore(x: Int): Int {
        return x + 5;
    }
}

contract TestDerivedContract(x: Int) with TestDerivedTrait {
    // Mandatory override of abstract function from TestBaseTrait (via TestDerivedTrait)
    override fun compute(x: Int): Int {
        return x + 100;
    }
    // Overriding the virtual function
    override fun computeMore(x: Int): Int {
        return x - 3;
    }

    receive() {
        let a = self.compute(10);
        let b = self.computeMore(10);
        dump(a);
        dump(b);
        cashback(sender());
    }
}
