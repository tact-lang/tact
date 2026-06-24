contract TestComplexReturn {
    fun complex(x: Int): Int {
         if (x < 0) {
             return -1;
         } else {
             repeat (10) {
                 if (x == 5) {
                     return x + 10;
                 }
             }
             {
                 let y: Int = x * 2;
                 if (y > 100) {
                     return 100;
                 }
             }
             return x;
         }
    }
}
