/* Fuzz tests for return statement behavior in Tact
   Testing regular functions, getters, receivers, loops, optional returns, and tuple returns.
   Note: Global functions cannot return inline tuple types like (Int, Int). Instead, we define a struct for tuple returns.
*/

// Test 1: Simple function with early return based on condition
fun testSimpleReturn(x: Int): Int {
    if (x > 0) {
         return x;
    }
    return -x;
}

// Test 2: Function with a nested block containing a return statement
fun testNestedReturn(x: Int): Int {
    {
         if (x == 0) {
             return 42;
         }
    }
    return x + 1;
}

// Test 3: Contract with a getter that returns a simple value
contract TestGetter {
    v: Int;

    // Initialization function
    init(initVal: Int) {
         self.v = initVal;
    }

    // Getter using proper syntax for getter functions
    get fun getVal(): Int {
         if (self.v > 10) {
             return self.v;
         }
         return 0;
    }
}

// Define a struct for tuple return
struct TupleReturn { first: Int; second: Int }

// Test 4: Contract with a getter returning a tuple (via struct)
contract TupleGetter {
    get fun getTuple(): TupleReturn {
         if (true) {
             return TupleReturn { first: 1, second: 2 };
         } else {
             return TupleReturn { first: 3, second: 4 };
         }
    }
}

// Test 5: Contract with a receiver function that explicitly returns (even though return value is ignored)
contract ReceiverReturn {
    receive() {
         return;
    }
}

// Test 6: Function returning an optional Int; using braces for clarity
fun testReturnOptional(x: Int): Int? {
    if (x > 10) { 
        return x;
    } else { 
        return null;
    }
}

// Test 7: Function with a return inside a repeat loop
fun testReturnInLoop(limit: Int): Int {
    repeat (limit) {
         if (limit > 0) { return limit; }
    }
    return 0;
}

// Test 8: Function explicitly returning unit, without an explicit return type
fun testReturnUnit() {
    return;
}

// Test 9: Global function returning a tuple via a struct
fun testReturnTuple(): TupleReturn {
    return TupleReturn { first: 100, second: 200 };
}

// Test 10: Function with conditional tuple return via a struct
fun testConditionalTuple(flag: Bool): TupleReturn {
   if (flag) { 
       return TupleReturn { first: 1, second: 1 };
   } else { 
       return TupleReturn { first: 2, second: 2 };
   }
}

/* The following erroneous test cases are commented out:

// Test A: Mismatched return type (should fail compilation)
fun testMismatchedReturn(x: Int): Int {
     if (x > 0) return x;
     else return "error"; // Expected type Int
}

// Test B: Missing return in one code path (should fail compilation)
fun testMissingReturn(x: Int): Int {
     if (x > 0) return x;
     // Missing return statement when x is not > 0
}
*/
