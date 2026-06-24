contract Test {
    fun testNested(x: Int): Int {
         if (x > 5) {
              {
                   return 42;
              }
         }
         return x;
    }
}
