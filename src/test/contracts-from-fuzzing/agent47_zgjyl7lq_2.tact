struct Result { a: Int; b: Int; c: Int; d: Int; }

trait T {
    // Abstract function: must be overridden
    abstract fun f(x: Int): Int;
    // Virtual function: can be overridden, default returns x+1
    virtual fun g(x: Int): Int {
        return x + 1;
    }

    // Abstract constant: must be overridden
    abstract const C: Int;
    // Virtual constant: default value 10, can be overridden
    virtual const D: Int = 10;
}

contract A() with T {
    // Override the abstract function f(x): expected behavior: multiply by 2
    override fun f(x: Int): Int {
         return x * 2;
    }
    
    // Override the abstract constant C with value 3
    override const C: Int = 3;
    
    // Override the virtual constant D with value 20
    override const D: Int = 20;

    // Getter function returning a struct with the calculated values:
    // f(2) should be 4, g(2) should be 3 (default implementation), C=3, D=20
    get fun test(): Result {
         return Result{ a: self.f(2), b: self.g(2), c: self.C, d: self.D };
    }
}
