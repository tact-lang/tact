struct Pair {
    first: Int;
    second: Int;
}

contract FuzzReturnAdvanced {
    
    // Function with nested blocks and multiple return paths
    fun nestedReturn(x: Int): Int {
        {
            if (x < 5) {
                return 100;
            }
        }
        if (x > 10) {
            return 200;
        } else {
            {
                return 300;
            }
        }
    }
    
    // Function with a repeat loop that includes an inner nested condition with return
    fun loopReturn(limit: Int): Int {
        repeat (limit) {
            if (limit > 3) {
                if (limit == 5) { 
                    return 555;
                }
            }
        }
        return limit * 2;
    }
    
    // Getter returning an optional Pair
    get fun getterOptPair(): Pair? {
        if (self.flag) {
            return Pair { first: 10, second: 20 };
        } else {
            return null;
        }
    }
    
    flag: Bool = true;
    
    // Function combining recursion with a repeat loop
    fun mixedRecursion(x: Int): Int {
        if (x == 0) { 
            return 0;
        }
        repeat (x) {
            if (x % 2 == 0) { 
                return x + self.mixedRecursion(x - 1);
            }
        }
        return x - 1;
    }
}
