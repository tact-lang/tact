trait A {
    // Define an abstract function f
    abstract fun f(): Int;

    // Define a virtual function that can be overridden.
    virtual fun g(): Int {
        return self.f() + 10;
    }

    // A concrete function that uses the abstract one
    fun h(): Int {
        return self.f() * 2;
    }
}

contract TestC(x: Int) with A {
    // Override the abstract function. Note: state variables (contract parameters) must be accessed via self.
    override fun f(): Int {
        return self.x;
    }

    // Override the virtual function
    override fun g(): Int {
        return self.x + 20;
    }

    receive() {
        let a = self.h();       // expected = 2 * self.x
        let b = self.g();       // expected = self.x + 20
        dump(a + b);            // expected result: 3*self.x + 20
    }
}
