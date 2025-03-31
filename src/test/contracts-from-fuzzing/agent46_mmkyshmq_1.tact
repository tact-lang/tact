fun testEarlyReturn(x: Int): Int {
   if (x > 10) {
       return x;
   }
   return x + 1;
}
