trait A {
    // Virtual function with default implementation
    virtual fun f(): Int {
        return 1 + 1;
    }
}

trait B with A {
    // Virtual function that calls function f from trait A
    virtual fun g(): Int {
        return self.f() + 3;
    }
}

contract C() with B {
    // Override f()
    override fun f(): Int {
        return 10;
    }
    
    // Override g()
    override fun g(): Int {
        return self.f() * 2;
    }
    
    receive() {
        let result = self.f() + self.g();
        // Expected: f() = 10, g() = 20, result = 30
        dump(result);
    }
}
