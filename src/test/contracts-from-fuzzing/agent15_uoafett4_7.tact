trait M {
    // A helper that calls the abstract function foo(), using dynamic dispatch
    fun callFoo(): Int {
        return self.foo();
    }
    
    // Abstract function that should be overridden
    abstract fun foo(): Int;
}

contract C() with M {
    // Override foo() to return 42
    override fun foo(): Int {
        return 42;
    }
    
    receive() {
        // Calling callFoo() should invoke the overridden foo() and return 42
        dump(self.callFoo());
    }
}
