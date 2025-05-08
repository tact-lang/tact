trait RecursiveT {
    // Abstract function r(x): must be overridden
    abstract fun r(x: Int): Int;
    // Recursive function calc, using self to call r and calc
    fun calc(x: Int): Int {
         if (x <= 0) { return 0; }
         return self.r(x) + self.calc(x - 1);
    }
}

contract R() with RecursiveT {
    // Override abstract function: simply return x
    override fun r(x: Int): Int {
         return x;
    }
    
    // Getter that returns test result: calc(3) should compute 3 + 2 + 1 = 6
    get fun testCalc(): Int {
         return self.calc(3);
    }
}
