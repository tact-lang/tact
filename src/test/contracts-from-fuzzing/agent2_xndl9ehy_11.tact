/* Additional fuzz tests for return statements in Tact
   Focusing on complex nested and early returns within loops and nested blocks.
*/

// Test 11: Function with multiple nested blocks and a repeat loop with early returns
fun advancedReturn(threshold: Int): Int {
    let acc: Int = 0;
    repeat (threshold) {
         // Early return if adding 5 exceeds threshold
         if (acc + 5 > threshold) { 
             return acc + 5;
         }
         {
             // Nested block with its own conditional return
             let tmp: Int = 2 * threshold;
             if (tmp > 10) {
                 return tmp;
             }
         }
         // Accumulate normally
         acc = acc + 1;
    }
    return acc;
}

// Test 12: Contract with a receiver that uses nested blocks with returns
contract ComplexReceiver {
    flag: Bool;
    
    // Initialization with a flag
    init(f: Bool) {
         self.flag = f;
    }

    // Receiver function with nested conditions and early return
    receive() {
         if (self.flag) {
             {
                 // Nested block condition
                 if (true) {
                     return; // early return, disregarding further code
                 }
             }
             // This code will never execute if flag is true
             dump("Should not reach here");
         } else {
             dump("Flag is false");
         }
    }
}
