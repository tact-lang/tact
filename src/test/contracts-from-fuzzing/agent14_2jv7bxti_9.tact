struct Pair {
    a: Int;
    b: Int;
}

contract Test {
    // Unit function with explicit return
    fun unitFunc() {
         return;
    }

    // Function with nested block return
    fun nested(x: Int): Int {
         if (x > 100) {
              { return x / 2; }
         } 
         return x + 1;
    }

    // Function with early return inside a while loop
    fun loopReturn(n: Int): Int {
         let i = n;
         while (i > 0) {
              if (i == n / 2) {
                   return i;
              }
              i = i - 1;
         }
         return -1;
    }

    // Function using ternary operator in return expression
    fun ternaryReturn(flag: Bool): Int {
         return flag ? 10 : 20;
    }

    // Function returning an optional Int
    fun optionalReturn(flag: Bool): Int? {
         if (flag) {
              return null;
         }
         return 42;
    }

    // Getter returning a Pair struct, simulating tuple-like behavior
    get fun getPair(flag: Bool): Pair {
         if (flag) {
              return Pair{ a: 1, b: 2 };
         }
         return Pair{ a: 3, b: 4 };
    }

    // Receiver with early return
    receive () {
         if (false) {
              return;
         }
         // Normal receiver execution
    }
}
