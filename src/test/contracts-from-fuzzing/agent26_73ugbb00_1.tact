fun test_return1(x: Int): Int {
   if (x > 0) {
       return x;
   }
   {
       return -x;
   }
}
