// Fuzz testing cycle for return statement behavior in Tact
// Based on the documented specifications (see docs_book_statements.md   and docs_book_func.md  ), this test suite targets various scenarios:
// 
// 1. Regular functions with early returns and returns from nested blocks
// 2. Functions returning unit (implicit) types
// 3. Functions returning optional values
// 4. Functions returning struct (tuple-like) values
// 5. Getter functions, including conditional branches
// 6. Receivers: Testing 'return' within receive blocks with nested conditionals
// 7. Returns within loops and deep nested conditionals
// 
// Each test case is designed to stress different aspects of return statement behavior.

struct Pair { a: Int; b: Int }

contract TestReturns {
    // Test 1: Regular function with early and nested returns
    fun earlyReturn(x: Int): Int {
        if (x < 0) {
            return -1;
        } else {
            { // nested block
                let y = x * 2;
                if (y > 10) {
                    return y;
                }
            }
            return x;
        }
    }

    // Test 2: Function with an implicit unit return
    fun returnUnit() {
        // No value is expected to be returned, unit is implicit
        return;
    }

    // Test 3: Function returning an optional Int
    fun returnOptional(b: Bool): Int? {
       if (b) {
          return 42;
       } else {
          return null;
       }
    }

    // Test 4: Function returning a struct as a tuple-like value
    fun returnStructTuple(cond: Bool): Pair {
         if (cond) { 
             return Pair { a: 1, b: 2 };
         }
         return Pair { a: 3, b: 4 };
    }

    // Test 5: Getter function with a conditional return
    get fun getterTest(): Int {
        let x = 100;
        if (x > 50) {
            return x;
        }
        return 0;
    }

    // Test 6: Getter function returning a struct value
    get fun getterTuple(cond: Bool): Pair {
         if (cond) {
            return Pair { a: 10, b: 20 };
         } else {
            return Pair { a: 30, b: 40 };
         }
    }

    // Test 7: Receiver testing return behavior with nested blocks
    receive () {
       if (now() % 2 == 0) { 
           return;
       }
       {
         if (now() % 3 == 0) {
             return;
         }
       }
       // If neither condition holds, receiver completes normally
    }

    // Test 8: Function with return from within a loop
    fun returnFromLoop(limit: Int): Int {
         repeat (limit) {
             // For this test, if limit equals 3, return early
             if (limit == 3) {
                 return 42;
             }
         }
         return -1;
    }

    // Test 9: Function with nested conditional returns in inner blocks
    fun nestedConditional(x: Int): Int {
         if (x > 10) {
             {
                 if (x % 2 == 0) {
                     return x / 2;
                 }
             }
         }
         return x;
    }

    // Test 10: Getter with multiple nested returns
    get fun complexGetter(): Int {
         if (now() % 5 == 0) {
             return 5;
         }
         {
             if (now() % 7 == 0) {
                 return 7;
             }
         }
         return 1;
    }

    // Test 11: Deep nested returns in multiple levels
    fun deepNestedReturn(x: Int): Int {
         if (x == 0) {
             {
                 if (x == 0) {
                     return 100;
                 }
             }
         } else {
             {
                 if (x > 50) {
                     return 200;
                 }
                 {
                     if (x > 10) {
                         return 150;
                     }
                 }
             }
         }
         return x;
    }
}
