trait Layered {
    // Virtual function that calls another virtual/abstract function
    virtual fun first(): Int {
        return self.second() + 1;
    }

    // Abstract function; must be implemented by inheriting contract
    abstract fun second(): Int;
}

contract Derived() with Layered {
    // Provide implementation for the abstract function
    override fun second(): Int {
        return 10;
    }
    
    receive() {
        // first() should be computed as second() + 1, i.e., 10 + 1 = 11
        let r = self.first();
        require(r == 11, "Layered function computation failed");
        cashback(sender());
    }
}
