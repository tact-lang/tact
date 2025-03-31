contract TestReturnBehavior {
    // Regular function with nested block returns
    fun nestedReturn(a: Int): Int {
         if (a > 0) {
              if (a > 10) {
                   return a; // nested block level 1
              } else {
                   { let b: Int = a * 2; return b; } // nested block level 2
              }
         }
         return -1;
    }

    // Function using a repeat loop with an early return inside a nested block
    fun loopEarlyReturn(): Int {
         let i: Int = 0;
         repeat(5) {
              if (i * 2 == 6) {
                   return i * 3;
              }
              i = i + 1;
         }
         return 0;
    }

    // Getter with conditional return inside a nested block
    get fun returnFromGetter(): Int {
         if (true) {
             { return 100; }
         } else {
             return 200;
         }
    }

    // Receiver function with an early return inside a nested block
    receive() {
         let x = 10;
         if (x > 0) {
             { let y = 15; return; }
         }
         dump(x); // unreachable code
    }
}
