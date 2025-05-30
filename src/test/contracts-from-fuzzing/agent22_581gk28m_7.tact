trait T_A {
    // Abstract function that must be implemented in any inheriting contract
    abstract fun f(): Int;

    // Virtual function with default implementation,
    // note the explicit use of the 'self.' prefix when calling f()
    virtual fun g(): Int {
        return self.f() + 1;
    }

    // Abstract constant: must be overridden
    abstract const A: Int;

    // Virtual constant with a default value (can be optionally overridden)
    virtual const B: Int = 50;
}

trait T_B {
    // A simple function provided by T_B
    fun h(): Int {
        return 10;
    }
}

contract C1() with T_A, T_B {
    // Provide implementation for abstract function f
    override fun f(): Int {
        return 7;
    }

    // Override the abstract constant A
    override const A: Int = 5;

    // Override the virtual constant B
    override const B: Int = 60;

    receive() {
        // Calling inherited functions: h() from T_B and g() from T_A using self
        let result = self.h() + self.g(); // expected: self.h() = 10, self.g() = self.f() + 1 = 7+1 = 8
                                          // so result should be 10 + 8 = 18
        dump(result);
        cashback(sender());
    }
}
