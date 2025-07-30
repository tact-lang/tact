struct Pair { first: Int; second: Int }

contract Test {
    // Function with multiple return paths using if-else
    fun multiReturn(x: Int): Int {
         if (x < 0) {
              return -x;
         } else if (x == 0) {
              return 42;
         } else {
              return x + 1;
         }
    }
    
    // Function with a nested return in a conditional branch
    fun nestedReturn(x: Int): Int {
         if (x > 100) {
              return 999;
         }
         let y: Int = x * 2;
         return y + 3;
    }
    
    // Function using a repeat loop with an early return
    fun earlyLoop(n: Int): Int {
         // repeat is a loop that executes its body n times
         repeat (n) {
              // if n is greater than 5, return immediately
              if (n > 5) {
                   return 999;
              }
         }
         return 0;
    }
    
    // Getter returning a struct value
    get fun getPair(): Pair {
         if (now() % 2 == 0) {
              return Pair{ first: 1, second: 2 };
         }
         return Pair{ first: 3, second: 4 };
    }
    
    // Receiver function with early exit; receivers do not return a value
    receive () {
         if (now() % 2 == 0) {
              return;
         } else {
              dump(123);
              return;
         }
    }
}
