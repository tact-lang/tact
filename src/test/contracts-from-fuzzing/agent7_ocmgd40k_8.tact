trait T1 {
    // Abstract function that must be overridden
    abstract fun method(): Int;

    // Concrete function that uses method()
    fun callMethodT1(): Int {
        return self.method() + 1;
    }
}

trait T2 {
    // Concrete function defined in T2
    fun callMethodT2(): Int {
        return 2;
    }
}

contract MultiTest(x: Int) with T1, T2 {
    // Override the abstract function from T1
    override fun method(): Int {
        return self.x;
    }

    receive() {
        let a = self.callMethodT1(); // Expected: self.x + 1
        let b = self.callMethodT2(); // Expected: 2
        dump(a + b);              // Expected result: self.x + 3
    }
}
