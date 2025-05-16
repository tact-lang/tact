// Test 1: Nested block return in a regular function
contract Test1 {
    receive() {}

    fun test1(n: Int): Int {
         if (n > 10) {
              { return n; } // nested block
         } else {
              return -n;
         }
    }
}
