contract TestNestedLoopReturn {
    fun process(n: Int): Int {
         let res: Int = 0;
         repeat(n) {
             { 
               // Nested block inside repeat
               if (n > 10) {
                   return 123;
               }
             }
             res = res + 1;
         }
         return res;
    }
}
