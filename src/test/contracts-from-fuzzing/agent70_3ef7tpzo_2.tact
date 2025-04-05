trait TraitA {
    // Abstract function
    abstract fun f(): Int;
    // Virtual function with default implementation
    virtual fun g(): Int {
        return 100;
    }

    // Abstract constant, must be overridden
    abstract const C1: Int;
    // Virtual constant, has a default but can be overridden
    virtual const C2: Int = 50;
}

trait TraitB {
    fun h(): Int {
        return 200;
    }
}

contract Test() with TraitA, TraitB {
    // Override abstract function
    override fun f(): Int {
        return 1;
    }
    // Override virtual function
    override fun g(): Int {
        return 2;
    }
    // Override abstract constant
    override const C1: Int = 3;
    // Override virtual constant
    override const C2: Int = 4;

    receive() {
        // Use the overridden functions and constants. Note: trait functions and constants must be accessed via self.
        let res = self.f() + self.g() + self.h() + self.C1 + self.C2;
        // Expected result: 1 + 2 + 200 + 3 + 4 = 210
        dump(res);
    }
}
