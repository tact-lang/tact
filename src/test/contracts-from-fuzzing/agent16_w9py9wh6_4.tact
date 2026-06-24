trait UniqueBaseTrait {
    // Abstract function
    abstract fun compute(a: Int): Int;

    // Virtual function
    virtual fun doubleIt(a: Int): Int {
        return a * 2;
    }

    // Abstract constant
    abstract const ANSWER: Int;

    // Virtual constant
    virtual const MULT: Int = 3;
}

contract TraitTest(initial: Int) with UniqueBaseTrait {
    // Override abstract function using the contract's parameter 'initial'
    override fun compute(a: Int): Int {
        return a + self.initial;
    }

    // Override virtual function
    override fun doubleIt(a: Int): Int {
        return a * 3; // changed behavior
    }

    // Override abstract constant
    override const ANSWER: Int = 42;

    // Override virtual constant
    override const MULT: Int = 5;

    fun test() {
        let res1 = self.compute(7); // should be 7 + initial
        let res2 = self.doubleIt(4); // should be 12
        dump(res1);
        dump(res2);
        dump(self.ANSWER);
        dump(self.MULT);
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
