trait TraitA {
    // Abstract function that must be overridden
    abstract fun f(x: Int): Int;

    // Virtual function with a default implementation
    virtual fun g(x: Int): Int {
        return x + self.V;
    }

    // Virtual constant with a default value
    virtual const V: Int = 10;
}

trait TraitB {
    // Concrete function provided by the trait
    fun h(x: Int): Int {
        return x * 2;
    }
}

contract C() with TraitA, TraitB {
    // Override the abstract function f
    override fun f(x: Int): Int {
        return x * 3;
    }

    // Override the virtual function g (optional, could use default)
    override fun g(x: Int): Int {
        return x + self.V;  // Same as default, but here for clarity
    }

    // Override the virtual constant V
    override const V: Int = 20;

    // Getter that combines the functions
    // For input x, we get: f(x) + g(x) + h(x)
    // f(10) = 10*3 = 30, g(10) = 10+20 = 30, h(10) = 10*2 = 20, sum = 80
    get fun result(x: Int): Int {
        return self.f(x) + self.g(x) + self.h(x);
    }

    // Receiver to run the test
    receive() {
        dump(self.result(10));
        cashback(sender());
    }
}
