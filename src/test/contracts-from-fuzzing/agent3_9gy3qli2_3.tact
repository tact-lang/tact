struct Pair {
    first: Int;
    second: Int;
}

struct Triple {
    first: Int;
    second: Int;
    third: Pair;
}

trait A {
    // Abstract function
    abstract fun f(x: Int): Int;
    
    // Virtual function with default implementation
    virtual fun g(x: Int): Int {
        return x + 1;
    }
    
    // Abstract constant
    abstract const k: Int;
    
    // Virtual constant with default value
    virtual const v: Int = 20;
    
    // Getter returning both constants in a Pair
    get fun constants(): Pair {
        return Pair{ first: self.k, second: self.v };
    }
}

contract C() with A {
    // Override abstract function f
    override fun f(x: Int): Int {
        return x * 2;
    }
    
    // Override virtual function g
    override fun g(x: Int): Int {
        return x * 3;
    }
    
    // Override abstract constant k using a literal constant value
    override const k: Int = 50;
    
    // Override virtual constant v
    override const v: Int = 55;
    
    // Getter to test invocation which returns a Triple combining results
    get fun test_all(x: Int): Triple {
        return Triple{
            first: self.f(x),
            second: self.g(x),
            third: self.constants()
        };
    }
}
