struct Pair { a: Int; b: Int }
struct GetPair { a: Int; b: Int }

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
    get fun getterTuple(cond: Bool): GetPair {
         if (cond) {
            return GetPair { a: 10, b: 20 };
         } else {
            return GetPair { a: 30, b: 40 };
         }
    }

    // Test 7: Receiver testing return behavior
    receive () {
       // Early return in receiver
       if (now() % 2 == 0) { 
           return;
       }
       {
         if (now() % 3 == 0) {
             return;
         }
       }
       // Fallback: do nothing
    }
}
