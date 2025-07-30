fun nestedTryReturn(): Int {
    try {
        try {
            throw(10);
        } catch (e) {
            // return inside inner catch
            return e * 2; // expected to return 20
        }
    } catch (e) {
        // outer catch (should not be reached in this case)
        return 0;
    }
}

fun loopTestReturn(): Int {
    let mutableSum: Int = 0;
    repeat (5) {
        try {
            if (mutableSum == 2) { 
                // Early exit from the function
                return 42;
            }
            mutableSum = mutableSum + 1;
        } catch (_) {
            // Ignored
        }
    }
    return mutableSum;
}

fun testThrowInCatch(): Int {
    try {
        throw(50);
    } catch (e) {
        // Throwing from within a catch block
        throw(e + 1);
    }
}

fun testThrowIf(): Int {
   try {
      throwIf(200, true);
      // This line should not be reached because condition is true
      return 0;
   } catch (e) {
      return e; // expects to catch exit code 200
   }
}

fun testThrowUnless(): Int {
   try {
       throwUnless(300, false);
       // This line should not be reached because condition is false
       return 0;
   } catch (e) {
       return e; // expects to catch exit code 300
   }
}

fun testIfElse(cond: Bool): Int {
    if (cond) {
         return 1;
    } else {
         return 2;
    }
}

// Contract with a receiver block to test receiver-level control flow
// Note: In Tact, contracts are deployed externally, so we don't instantiate them in a main function.
contract TestReceiver {
    v: Int = 0;

    receive() {
         // Simulate a condition (always false here)
         if (1 == 0) {
              return;
         }
         try {
              throw(101);
         } catch (err) {
              // Update the contract's state variable in the catch block
              self.v = self.v + err; // expected self.v becomes 101
         }
    }
}

fun main() {
    dump(nestedTryReturn());    // Expected output: 20
    dump(loopTestReturn());       // Expected output: 42 (because early return when mutableSum == 2)
    try {
       dump(testThrowInCatch()); // Expected to throw and be caught in main
    } catch (e) {
       dump(e);                  // Expected output: 51
    }
    dump(testThrowIf());          // Expected output: 200
    dump(testThrowUnless());      // Expected output: 300
    dump(testIfElse(true));       // Expected output: 1
    dump(testIfElse(false));      // Expected output: 2

    // Note: Receiver-level control flow in contract TestReceiver can only be tested via external messages
    // and is not instantiated here.
}
