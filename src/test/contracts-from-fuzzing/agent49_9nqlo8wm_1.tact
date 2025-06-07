struct Result { a: Int; b: Int; c: Int; }

trait TraitA {
    // Abstract function: must be overridden by contracts implementing the trait
    abstract fun foo(x: Int): Int;

    // Virtual function with a default implementation
    virtual fun bar(x: Int): Int {
        return x + self.valueB;
    }

    // Abstract trait-level constant: must be provided by the implementing contract
    abstract const valueA: Int;

    // Virtual trait-level constant with a default value
    virtual const valueB: Int = 10;
}

contract TestContract() with TraitA {
    // Overriding the abstract function
    override fun foo(x: Int): Int {
        return x + self.valueA;
    }

    // Overriding the abstract constant and the virtual constant
    override const valueA: Int = 5;
    override const valueB: Int = 20;

    // A getter function that returns a Result struct with computed values
    get fun test(): Result {
        return Result { a: self.foo(3), b: self.bar(3), c: self.valueB };
    }
}
