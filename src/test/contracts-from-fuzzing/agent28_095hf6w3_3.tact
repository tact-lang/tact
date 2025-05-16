trait T1 {
    // Abstract function without body
    abstract fun af(): Int;
    // Virtual function with default implementation
    virtual fun vf(): Int { 
        return 10; 
    }

    // Abstract constant must be overridden by contract
    abstract const TABSTRACT: Int;

    // Virtual constant with default value
    virtual const TVIRTUAL: Int = 20;
}

struct Result {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

contract C1() with T1 {
    // Override abstract function
    override fun af(): Int {
        return 100;
    }
    
    // Override abstract constant
    override const TABSTRACT: Int = 200;

    // Override virtual function
    override fun vf(): Int {
        return self.TVIRTUAL + 5;
    }
    
    get fun result(): Result {
         // Correctly call trait functions via self. prefix
         return Result{ a: self.af(), b: self.vf(), c: self.TABSTRACT, d: self.TVIRTUAL };
    }
}
