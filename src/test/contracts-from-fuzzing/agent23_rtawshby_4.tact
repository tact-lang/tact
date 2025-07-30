trait TraitX {
    // Virtual constant with default value, can be overridden in inheriting traits or contracts
    virtual const CX: Int = 100;
    
    // A virtual function that uses the constant
    virtual fun f1(): Int {
        return self.CX + 1;
    }
}

trait TraitY with TraitX {
    // Override the virtual constant in this trait
    override const CX: Int = 150;
    
    // Additional virtual function
    virtual fun f2(): Int {
        return self.f1() + 2;
    }
}

contract TestConstMulti() with TraitY {
    // Further override the virtual constant
    override const CX: Int = 200;
    
    receive() {
        // Expected that constant CX in the final contract is 200
        // f1() should compute 200 + 1 = 201
        // f2() should compute f1() + 2 = 201 + 2 = 203
        let a = self.f1();
        let b = self.f2();
        require(a == 201, "f1 constant propagation error");
        require(b == 203, "f2 constant propagation error");
    }
}
