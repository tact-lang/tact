contract TestWhileReturn {
    fun test(x: Int): Int {
         while (x > 0) {
              if (x == 3) {
                   return 123;
              }
              return 999;
         }
         return 0;
    }
}
