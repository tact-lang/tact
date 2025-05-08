struct TupleReturn { first: Int; second: Int }

message Msg {}

contract Test {
    // 1. Regular function with early return
    fun foo(x: Int): Int {
        if (x < 0) { return 0; }
        return x;
    }
    
    // 2. Getter returning a struct as a replacement for a tuple literal
    get fun tuple(): TupleReturn {
        if (true) { return TupleReturn { first: 1, second: 2 }; }
        return TupleReturn { first: 3, second: 4 };
    }
    
    // 3. Function demonstrating a while loop with an inner block return
    fun whileReturn(x: Int): Int {
        let y: Int = x;
        while (y > 0) {
            if (y == 5) { return y; }
            y = y - 1;
        }
        return 0;
    }
    
    // 4. Receiver function that returns to end execution
    receive (msg: Msg) {
        return;
    }
    
    // The following functions are intended to produce compile errors and are commented out:
    
    /*
    // 5. Function with missing return in one branch (should cause a compile error)
    fun missingReturn(x: Int): Int {
        if (x > 0) { return x; }
        // Missing a return for x <= 0
    }
    */
    
    /*
    // 6. Function with mismatched return types (should cause a type error)
    fun inconsistentReturn(flag: Bool): Int {
        if (flag) { return 1; } else { return "two"; }
    }
    */
    
    /*
    // 7. Function attempting to use a tuple literal as its return type (should cause a compile error)
    fun retTuple(flag: Bool): (Int, String) {
        if (flag) { return (1, "yes"); } else { return (0, "no"); }
    }
    */
}
