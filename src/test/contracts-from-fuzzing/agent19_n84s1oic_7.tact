trait Computable {
    // Abstract function: expects an Int parameter named x
    abstract fun compute(x: Int): Int;
}

contract ComputeImpl() with Computable {
    // Overriding abstract function using different parameter name (y instead of x)
    override fun compute(y: Int): Int {
        return y * 2;
    }

    receive() {
        dump(self.compute(21)); // Expected output: 42
    }
}
