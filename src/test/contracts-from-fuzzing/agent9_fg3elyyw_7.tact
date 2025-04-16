struct Pair { a: Int; b: Int }

contract Test {
    // Test 1: Regular function with early and nested returns
    fun earlyReturn(x: Int): Int {
        if (x < 0) {
            return -1;
        } else {
            {
                let y = x * 2;
                if (y > 10) {
                    return y;
                }
            }
            return x;
        }
    }

    // Test 2: Function returning unit type
    fun returnUnit() {
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

    // Test 4: Function returning a struct (tuple-like) value
    fun returnStructTuple(cond: Bool): Pair {
         if (cond) { 
             return Pair { a: 1, b: 2 };
         }
         return Pair { a: 3, b: 4 };
    }

    // Test 5: Getter function with conditional return
    get fun getterTest(): Int {
        let x = 100;
        if (x > 50) {
            return x;
        }
        return 0;
    }

    // Test 6: Getter function returning a tuple-like struct
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
    }

    // Test 8: Function with return from inside a repeat loop
    fun returnFromLoop(limit: Int): Int {
         repeat (limit) {
             if (limit == 3) {
                 return 42;
             }
         }
         return -1;
    }

    // Test 9: Function with nested conditional returns inside a block
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
}
