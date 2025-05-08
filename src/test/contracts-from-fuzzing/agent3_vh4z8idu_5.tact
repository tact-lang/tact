struct Pair { first: Int; second: Int }

contract ReturnEdgeCases {
    // Return in nested loops/conditions
    fun nestedLoopReturn(x: Int): Int {
         repeat(3) {
              if (x == 10) { return x; }
              { if (x < 5) { return x * 2; } }
         }
         return 100;
    }
    
    // Function that returns unit implicitly
    fun implicitUnit() {
         // No explicit return needed
    }
    
    // Function with multiple conditional returns
    fun multiConditional(x: Int): Int {
         if (x < 0) { return -x; }
         else if (x == 0) { return 0; }
         else { return x; }
    }
    
    // Function with return in nested block and loop
    fun complex(x: Int): Int {
         if (x % 2 == 0) {
             { let a = x / 2; return a; }
         } else {
             repeat (2) {
                 if (x > 10) { return x; }
             }
         }
         return -1;
    }
    
    // Getter returning a Pair computed via conditional
    get fun computedPair(): Pair {
         if (self.data > 10) { return Pair { first: self.data, second: self.data - 1 }; }
         return Pair { first: self.data, second: self.data + 1 };
    }
    
    // State variable for getter
    data: Int = 15;
    
    // Valid receiver - implicit unit return
    receive() {}

    // The following function is intentionally commented out because it lacks a return statement and should fail compilation if enabled
    // fun missingReturn(): Int {
    //     if (false) { return 1; }
    // }
}
