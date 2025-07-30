/* Additional fuzz tests for return statements in Tact
   Focusing on nested returns, multiple return paths, and edge cases within complex blocks. */

contract ComplexReturn {
    counter: Int;

    // Initialization
    init(initVal: Int) {
         self.counter = initVal;
    }

    // Getter computing a value with multiple return paths and nested blocks
    get fun compute(): Int {
         if (self.counter == 0) {
             return 10;
         } else {
             {
                 if (self.counter < 5) {
                     return self.counter * 2;
                 }
             }
             return self.counter + 5;
         }
    }

    // Regular function with a return inside a repeat loop
    fun accumulate(limit: Int): Int {
         let sum: Int = 0;
         repeat (limit) {
              // if sum exceeds threshold, return early
              if (sum > 50) { return sum; }
              // Update sum with a constant increment
              // Note: augmented assignment is not an expression, so use explicit addition
              sum = sum + 7;
         }
         return sum;
    }

    // Function with multiple return paths returning an optional Int
    fun maybeReturn(x: Int): Int? {
         if (x < 0) { return null; }
         if (x == 0) { return 0; }
         return x * x;
    }
}
