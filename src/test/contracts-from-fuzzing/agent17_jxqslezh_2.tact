trait A {
    // Abstract function f must be defined by inheriting contracts
    abstract fun f(x: Int): Int;

    // Virtual function g provides a default implementation and can be overridden
    virtual fun g(x: Int): Int {
        return x + 1;
    }
}

contract TestContract(y: Int) with A {
    // Override the abstract function f, using self.y to access the parameter
    override fun f(x: Int): Int {
        return x * self.y;
    }
    
    // Override the virtual function g, using self.y
    override fun g(x: Int): Int {
        return x + self.y;
    }
    
    // Getter to test behavior of f; for example, with y = 3, f(2) should be 6
    get fun test_f(): Int {
        return self.f(2);
    }
    
    // Getter to test behavior of g; for example, with y = 3, g(2) should be 5
    get fun test_g(): Int {
        return self.g(2);
    }
}
