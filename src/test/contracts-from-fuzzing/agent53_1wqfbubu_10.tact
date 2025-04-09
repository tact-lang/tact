struct Triple { first: Int; second: Int; third: Int }

contract ReturnExamples {
    // Simple return
    fun simpleRet(): Int { 
        return 10;
    }

    // Early return with explicit if/else
    fun earlyReturn(cond: Bool): Int {
        if (cond) {
            return 100;
        } else {
            return 200;
        }
    }

    // Return from a nested block
    fun nestedBlockReturn(x: Int): Int {
        {
            if (x < 0) { 
                return -x;
            }
        }
        return x;
    }

    // Return from within a loop
    fun repeatReturn(n: Int): Int {
        repeat(n) {
            // For illustration, if n is even, return it immediately
            if (n % 2 == 0) {
                return n;
            }
        }
        return 0;
    }

    // Getter with conditional return, returning a struct
    get fun getTriple(): Triple {
        if (self.simpleRet() > 5) {
            return Triple { first: 1, second: 2, third: 3 };
        }
        return Triple { first: 0, second: 0, third: 0 };
    }

    // Function returning an optional Int
    fun optionalReturn(flag: Bool): Int? {
        if (flag) {
            return 42;
        }
        return null;
    }

    // Complex function with nested blocks and loops
    fun complexReturn(a: Int, b: Int): Int {
        if (a > b) {
            {
                if (a - b > 10) { 
                    return a;
                } else {
                    return b;
                }
            }
        } else {
            repeat(a) {
                if (b % 2 == 0) { 
                    return b;
                }
            }
        }
        return a + b;
    }
}
