trait MyTrait {
    // Abstract function: must be overridden
    abstract fun foo(): Int;

    // Virtual function with a default implementation
    virtual fun bar(): Int {
        return 42;
    }

    // Virtual constant that can be overridden (default 100)
    virtual const myConst: Int = 100;

    // Abstract constant that must be overridden
    abstract const absConst: Int;
}

contract TestContract() with MyTrait {
    // Override the abstract function
    override fun foo(): Int {
        return 7;
    }

    // Override the virtual function
    override fun bar(): Int {
        return 10;
    }

    // Override the virtual constant
    override const myConst: Int = 200;

    // Override the abstract constant
    override const absConst: Int = 300;

    receive() {
        let a: Int = self.foo();
        let b: Int = self.bar();
        let c: Int = self.myConst;
        let d: Int = self.absConst;
        dump(a);
        dump(b);
        dump(c);
        dump(d);
        cashback(sender());
    }
}
