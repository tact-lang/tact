fun testReturn(x: Int): Int {
   if (x > 0) {
     return x;
   }
   return 0;
}

// Forcing a call to the function to avoid “unused function” warnings
fun main() {
    testReturn(5);
    testReturn(-3);
}
