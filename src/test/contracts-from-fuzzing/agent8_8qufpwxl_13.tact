trait ParamFunc {
    // Abstract function with a parameter named 'a'
    abstract fun f(a: Int): Int;
}

contract ParamOverride() with ParamFunc {
    // Override the abstract function; parameter name is 'b' (names can differ, only types must match)
    override fun f(b: Int): Int {
        return b + 1;
    }

    receive() {
        let result = self.f(20); // Expected 21
        return;
    }
}
