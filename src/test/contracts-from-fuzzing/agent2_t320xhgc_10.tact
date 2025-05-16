struct GetterReturn { val: Int; }

contract ExhaustiveReturns {
    // f1: Nested block with multiple return paths; tests early returns in nested blocks
    fun f1(x: Int): Int {
         {
             if (x > 10) {
                 return x + 5;
             } else {
                 { if (x == 10) { return 10; } }
                 return x - 5;
             }
         }
    }
    
    // f2: Uses a repeat loop to perform an early return
    fun f2(x: Int): Bool {
         repeat(3) {
             if (x < 0) { 
                 return false; 
             }
         }
         return true;
    }
    
    // factorial: A recursive function that uses early return in the base case
    fun factorial(n: Int): Int {
         if (n <= 1) { return 1; }
         return n * self.factorial(n - 1);
    }
    
    // g1: Getter function with a nested block return
    get fun g1(y: Bool): GetterReturn {
         if (y) {
             return GetterReturn{ val: 100 };
         } else {
             { if (!y) { return GetterReturn{ val: 200 }; } }
         }
         return GetterReturn{ val: 300 };
    }
    
    // Receiver function with a simple return
    receive () {
         if (true) { return; }
    }
}
