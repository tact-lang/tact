trait TraitTest {
    // Abstract function that must be implemented by any inheriting contract
    abstract fun foo(): Int;

    // Virtual function with a default implementation
    virtual fun bar(): Int {
        return 100;
    }

    // Abstract constant: must be overridden in the inheriting contract
    abstract const A: Int;

    // Virtual constant with default value
    virtual const B: Int = 200;
}

contract TestContract2() with TraitTest {
    // Override the abstract function foo
    override fun foo(): Int {
        return 42;
    }

    // Override the abstract constant A with a concrete value
    override const A: Int = 7;

    // Optionally override the virtual constant B
    override const B: Int = 300;

    // We do not override bar, so it uses the default implementation

    receive() {
        // Minimal receiver function invocation to ensure compilation
        cashback(sender());
    }
}
