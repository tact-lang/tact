trait A {
    // Abstract function; must be implemented by inheritors
    abstract fun foo(): Int;
    
    // Virtual function with a default implementation that can be overridden
    virtual fun bar(): Int {
        return self.foo() + 10;
    }
}

contract TestConcrete() with A {
    // Override the abstract function
    override fun foo(): Int {
        return 5;
    }

    // A test function that combines foo and bar
    fun test(): Int {
        return self.foo() + self.bar();
    }

    // A receiver to trigger the test at runtime
    receive() {
        let result = self.test();
        // Expected: foo() returns 5 and bar() returns 5+10 = 15, hence 5+15 = 20
        require(result == 20, "Unexpected result");
        cashback(sender());
    }
}
