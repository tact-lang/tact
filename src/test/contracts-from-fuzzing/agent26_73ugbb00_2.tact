fun loop_return_test(n: Int): Int {
   repeat (n) {
     if (n == 3) {
       return 999;
     }
   }
   return 0;
}
