trait A {
    // Provides a default implementation returning 5
    virtual fun num(): Int { 
        return 5;
    }
}

trait B with A {
    // Overrides num() and adds 10 to the result of self.num()
    override fun num(): Int {
        return self.num() + 10;
    }
}

contract D() with B {
    // Override num() to disambiguate and provide a concrete implementation
    override fun num(): Int {
        return 100;
    }

    receive() {
        // When invoked, self.num() should resolve to D.num(), i.e., 100
        let result = self.num();
        // No further actions, but compiling means the override chain works as expected
        cashback(sender());
    }
}
