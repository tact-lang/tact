struct Values {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

trait TraitA {
    // Abstract function must be overridden
    abstract fun foo(): Int;

    // Virtual function with default implementation
    virtual fun bar(): Int {
        return 1;
    }

    // Abstract constant must be overridden
    abstract const value: Int;

    // Virtual constant with default value
    virtual const v: Int = 2;
}

trait TraitB {
    // Regular function in a trait
    fun baz(x: Int): Int {
        return x * 2;
    }
}

contract TestContract() with TraitA, TraitB {
    // Override abstract and virtual functions
    override fun foo(): Int {
        return 10;
    }

    override fun bar(): Int {
        return 20;
    }

    // Override abstract constant and virtual constant
    override const value: Int = 30;
    override const v: Int = 40;

    // Getter to retrieve computed values from the trait functions and constants
    // Returns a struct of Values containing: foo(), bar(), baz(5), value, v
    get fun get_values(): Values {
        return Values { a: self.foo(), b: self.bar(), c: self.baz(5), d: self.value, e: self.v };
    }
}
