trait Trait1 {
    // Abstract function that must be overridden
    abstract fun a(): Int;

    // Virtual constant with default, can be overridden
    virtual const VA: Int = 100;
}

trait Trait2 {
    // Virtual function with default implementation using abstract constant VB
    virtual fun b(): Int {
        return self.VB;
    }

    // Abstract constant, must be overridden
    abstract const VB: Int;
}

contract Compound() with Trait1, Trait2 {
    // Override abstract function a()
    override fun a(): Int {
        return self.VA + 1;  // uses trait constant VA
    }

    // Override virtual function b()
    override fun b(): Int {
        return self.VB + 2;  // uses trait abstract constant VB
    }

    // Override virtual constant VA
    override const VA: Int = 50;
    
    // Override abstract constant VB
    override const VB: Int = 20;

    receive() {
        let result = self.a() + self.b();
        // Expected: a() = VA + 1 = 50 + 1 = 51; b() = VB + 2 = 20 + 2 = 22; total = 73
        dump(result);
        cashback(sender());
    }
}
