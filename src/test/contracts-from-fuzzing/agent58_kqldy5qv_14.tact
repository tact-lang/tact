contract TestOptionalReturn {
    // Function returning an optional Int
    fun test_optional(x: Int): Int? {
         if (x > 0) {
              return x + 1;
         } else {
              return null;
         }
    }
}

contract TestReturnChain {
    // Function chaining multiple explicit returns in conditionals
    fun chain_return(x: Int): Int {
         if (x == 0) {
              return 0;
         } else if (x < 0) {
              return -x;
         } else {
              // Nested block with another condition
              {
                   if (x > 100) { return 100; }
                   return x;
              }
         }
    }
}
