trait A {
    virtual fun foo(): Int {
        return 10;
    }
}

// Trait B now inherits A so it has foo in its scope
trait B with A {
    virtual fun bar(): Int {
        return self.foo() + 5;
    }
}

contract C() with B {
    // Override foo, making it accessible for both A and B
    override fun foo(): Int {
        return 20;
    }
    
    receive() {
         let result = self.bar(); // Expected 20 + 5 = 25
         return;
    }
}
