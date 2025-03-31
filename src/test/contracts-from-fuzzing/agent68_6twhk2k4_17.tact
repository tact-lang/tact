trait WildTrait {
    // Declare an abstract function using wildcards to discard parameter names
    abstract fun foo(_: Int, _: Int): Int;
}

contract TestTrait with WildTrait {
    // Override with explicit parameter names
    override fun foo(a: Int, b: Int): Int {
        return a + b;
    }

    receive() {
        let res: Int = self.foo(10, 20);
    }
}
