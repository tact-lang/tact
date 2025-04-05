trait A {
    // An abstract function that must be overridden
    abstract fun f(x: Int): Int;

    // A virtual function, with a default implementation
    virtual fun g(x: Int): Int {
        return x + 1;
    }

    // A virtual constant with a default value
    virtual const MY_CONST: Int = 10;

    // An abstract constant that must be provided by the implementing contract
    abstract const MY_ABS_CONST: Int;
}

trait B {
    // A concrete function provided by the trait
    fun h(x: Int): Int {
        return x * 2;
    }
}

contract C() with A, B {
    // Override the abstract function f from trait A
    override fun f(x: Int): Int {
        // Multiply the input by the abstract constant
        return x * self.MY_ABS_CONST;
    }

    // Override the virtual function g from trait A
    override fun g(x: Int): Int {
        // Add the virtual constant to the input
        return x + self.MY_CONST;
    }

    // Override the virtual constant MY_CONST
    override const MY_CONST: Int = 20;

    // Provide a concrete value for the abstract constant MY_ABS_CONST
    override const MY_ABS_CONST: Int = 3;

    // A getter function that combines the results of f, g, and h.
    // For an input x, we expect:
    //   f(x) = x * 3
    //   g(x) = x + 20
    //   h(x) = x * 2
    // Thus, result(x) = 3*x + (x + 20) + 2*x = 6*x + 20
    get fun result(x: Int): Int {
        return self.f(x) + self.g(x) + self.h(x);
    }

    // Receiver function to test our implementation
    receive() {
        // For x = 10, we expect: 6 * 10 + 20 = 80
        dump(self.result(10));
        cashback(sender());
    }
}
