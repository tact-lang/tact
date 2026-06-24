contract TestWhileReturn {
    fun whileReturn(x: Int): Int {
         while (x > 0) {
             if (x == 5) {
                  return x + 1;
             } else {
                  return x - 1;
             }
         }
         return 42;
    }

    // Using a while loop without any early returns
    fun whileNoReturn(x: Int): Int {
         let y = x;
         while (y > 0) {
             // perform some computation without returning early
             y = y - 1;
         }
         // Returning after loop finishes
         return y;
    }

    // Getter function using a nested return in a block
    get fun getValue(): Int {
         {
             let a = 10;
             if (a > 5) {
                 return a * 2;
             }
         }
         return 0;
    }
}
