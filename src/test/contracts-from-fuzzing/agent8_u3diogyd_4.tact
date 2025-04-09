trait TraitB {
    // Abstract function: must be implemented by inheriting contract
    abstract fun myAbs(x: Int): Int;
    
    // Virtual function that uses the abstract function
    virtual fun myVirt(x: Int): Int {
        // Should compute: myAbs(x) + 2
        return self.myAbs(x) + 2;
    }
    
    // Abstract constant: must be defined in inheriting contract
    abstract const myConst: Int;
    
    // Virtual constant with default value
    virtual const myVirtConst: Int = 50;
}

contract TestB() with TraitB {
    // Override the abstract function
    override fun myAbs(x: Int): Int {
         return x * 3;
    }
    
    // Override the abstract constant
    override const myConst: Int = 5;

    // Override the virtual constant
    override const myVirtConst: Int = 100;

    // Test function: calls both myAbs and myVirt; accesses constants
    fun testB() {
        // Expected: myAbs(2) = 6
        let r1 = self.myAbs(2);
        // myVirt(2) should be: myAbs(2) + 2 = 8
        let r2 = self.myVirt(2);
        let c1 = self.myConst;       // 5
        let c2 = self.myVirtConst;   // 100
        dump(r1);   // should dump 6
        dump(r2);   // should dump 8
        dump(c1);   // should dump 5
        dump(c2);   // should dump 100
    }

    receive() {
        self.testB();
        cashback(sender());
    }
}
