contract Test18Fixed2 {
    // Mixing direct returns with try-catch and recursive simulated loop
    fun conditionalReturn(x: Int, y: Int): Int {
         if (x < y) {
             return x;
         } else if (x == y) {
             try {
                throw(555);
             } catch (_) {
                return y;
             }
         } else {
             // Simulate a loop using recursion, calling self.rec
             return self.rec(x);
         }
    }
    fun rec(a: Int): Int {
         if (a == 0) { 
             return 0; 
         } else { 
             return self.rec(a - 1);
         }
    }
}

contract Test19 {
    // Test combining try-catch, nested if and early returns
    fun combineTest(a: Int, b: Int): Int {
         if (a == b) { return a; }
         try {
             if (a > b) { throw(1000); } else { return b; }
         } catch (err) {
             if (err == 1000) { return err; } else { throw(err + 1); }
         }
    }
}
