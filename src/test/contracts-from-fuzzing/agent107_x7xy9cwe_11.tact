struct Pair {
    a: Int;
    b: Int;
}

contract ValidReturnTest {
    // Immediate return in a regular function
    fun immediate(): Int {
        return 1;
    }
    
    // Nested block return in a regular function
    fun nested(): Int {
        { { return 55; } }
    }
    
    // Conditional return with two branches
    fun conditionalReturn(cond: Bool): Int {
        if (cond) {
            return 10;
        } else {
            return 20;
        }
    }
    
    // Optional return function
    fun optionalReturn(cond: Bool): Int? {
        if (cond) {
            return 30;
        } else {
            return null;
        }
    }
    
    // Getter with explicit return
    get fun getterExplicit(): Int {
        return 100;
    }
    
    // Receiver function (returns nothing)
    receive() {
        // Valid receiver with no explicit return value
    }
    
    // Function with a repeat loop and early return
    fun repeatReturn(): Int {
        repeat (3) {
            // In Tact, the repeat loop does not provide an iteration variable
            if (true) {
                return 42;
            }
        }
        return 0;
    }
    
    // Function returning a Pair struct (simulating tuple return)
    fun pairReturn(cond: Bool): Pair {
        if (cond) { 
            return Pair { a: 1, b: 2 };
        } 
        return Pair { a: 3, b: 4 };
    }
}
