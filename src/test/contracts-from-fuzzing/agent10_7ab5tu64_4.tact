trait A {
    // Abstract function
    abstract fun foo(): Int;
    // Helper function calling the abstract function
    fun callA(): Int { return self.foo(); }
}

trait B with A {
    // Provide a default override in trait B
    override fun foo(): Int { return self.callA() + 1; }
}

contract Diamond() with A, B {
    // Override the abstract function; this will be used by both A and B
    override fun foo(): Int { return 7; }
    
    // Getter to test diamond inheritance resolution
    get fun test(): Int {
        // self.callA() calls A.callA(), which in turn calls self.foo()
        return self.callA();
    }
}
