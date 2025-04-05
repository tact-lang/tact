trait A {
    // Abstract function that must be implemented
    abstract fun funA(): Int;
}

trait B {
    // Abstract function that must be implemented
    abstract fun funB(): Int;
}

contract C(x: Int) with A, B {
    // Override abstract functions from traits using the contract parameter 'x'
    override fun funA(): Int {
        return self.x; // Accessing contract parameter as a persistent field
    }
    
    override fun funB(): Int {
        return 2 * self.x;
    }
    
    receive() {
        // Correctly call trait functions via self
        let s = self.funA() + self.funB();
        dump(s);
    }
}
