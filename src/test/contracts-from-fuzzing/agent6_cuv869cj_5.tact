trait TraitA {
    // Virtual function with default implementation
    virtual fun f(): Int {
        return 1;
    }
    
    // Virtual constant with default value
    virtual const k: Int = 100;
}

trait TraitB with TraitA {
    // Override function f() from TraitA
    override fun f(): Int {
        return self.k + 1;
    }
    
    // Override constant k from TraitA
    override const k: Int = 200;
}

contract TestTraits() with TraitB, TraitA {
    receive() {
        // Call the function from the traits to verify override behavior
        let x = self.f();
        // x should be self.k + 1, i.e., 200 + 1 = 201
        // No further action, just minimal receiver
    }
}
