contract TestNestedReturn {
    fun test(a: Int): Int {
         if(a > 5) {
              { 
                  if(a > 10) { return 100; } else { a + 1 } 
              }
         }
         return a;
    }
}
