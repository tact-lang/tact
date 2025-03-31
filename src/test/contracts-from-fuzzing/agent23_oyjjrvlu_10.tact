struct Pair { a: Int; b: Int }

contract TestReturns {

    // Function demonstrating a return inside a nested block
    fun nestedBlock(flag: Bool): Int {
        {
            if (flag) { 
                return 100;
            }
        }
        return 50;
    }

    // Function with a return inside a while loop
    fun whileLoop(n: Int): Int {
        let i: Int = 0;
        while (i < n) {
            if (i == 3) {
                return i;
            }
            i = i + 1;
        }
        return -1;
    }

    // Function with conditional returns (all branches explicitly use return)
    fun condReturn(x: Int): Int {
        if (x > 10) { 
            return x;
        } else if (x == 10) { 
            return 10;
        } else { 
            return -x;
        }
    }

    // Getter function that returns a struct; uses explicit returns in conditions
    get fun getPair(x: Int): Pair {
         if (x > 0) {
            return Pair { a: x, b: x + 10 };
         }
         return Pair { a: 0, b: 10 };
    }

    // Function demonstrating optional return values using 'null'
    fun optionalReturn(x: Int): Int? {
        if (x == 0) {
            return null;
        } else {
            return x;
        }
    }

    // The following functions are intentionally omitted because they are expected to trigger compile errors:
    // 1. Implicit return (without an explicit 'return' keyword) - should trigger a "function does not always return a result" error
    // 2. Function with unreachable code after a return
    // 3. Receiver function using a return statement
}
