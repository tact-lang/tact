trait TraitA {
    // A normal function defined in TraitA
    fun fA(x: Int): Int {
        return x + 10;
    }
    
    // A virtual constant in TraitA
    virtual const a: Int = 5;
}

trait TraitB {
    // A normal function defined in TraitB
    fun fB(x: Int): Int {
        return x * 3;
    }
    
    // A virtual constant in TraitB
    virtual const b: Int = 7;
}

struct Result2 {
    r1: Int;
    r2: Int;
    r3: Int;
    r4: Int;
}

contract ComplexContract() with TraitA, TraitB {
    // Override the virtual constant 'a' from TraitA
    override const a: Int = 100;
    // Do not override 'b', so it remains 7
    
    // A getter function to combine outputs from TraitA and TraitB
    get fun result(x: Int): Result2 {
        return Result2 {
            r1: self.fA(x), // Expected: x + 10
            r2: self.fB(x), // Expected: x * 3
            r3: self.a,     // Expected: 100
            r4: self.b      // Expected: 7
        };
    }
}
