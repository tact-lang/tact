// Test snippet for trait calling abstract function

trait TraitC {
    // Abstract function
    abstract fun compute(x: Int): Int;
    // Concrete function that calls the abstract function
    fun computedValue(x: Int): Int {
        return 2 * self.compute(x);
    }
}

contract C() with TraitC {
    override fun compute(x: Int): Int {
        return x + 1;
    }
    
    receive() {
        dump(self.computedValue(10)); // Expect dump(22)
    }
}
