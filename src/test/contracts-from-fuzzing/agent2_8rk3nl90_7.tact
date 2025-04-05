trait Trait1 {
    // Virtual constant defined in Trait1
    virtual const VALUE: Int = 1;
}

trait Trait2 {
    // Virtual constant defined in Trait2
    virtual const VALUE: Int = 2;
}

contract Combined() with Trait1, Trait2 {
    // Because both traits define a virtual constant VALUE, we must override it.
    override const VALUE: Int = 100;
    
    // A simple function to compute a result using the overridden constant
    fun compute(): Int {
        return self.VALUE * 2; // expected 200
    }
    
    receive() {
        let res = self.compute();
        // For testing, we do not output the result, but it must be computed correctly.
        cashback(sender());
    }
}
