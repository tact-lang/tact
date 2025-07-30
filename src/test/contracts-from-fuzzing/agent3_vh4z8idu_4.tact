struct Pair { first: Int; second: Int }

contract TestReturnFuncs {
    // Regular function with early return
    fun f(x: Int): Int {
         if (x > 0) { return x; }
         return -x;
    }

    // Function with nested block return
    fun nestedReturn(): Int {
         {
             let a = 10;
             if (a > 5) { return a; }
         }
         return 0;
    }

    // Function with optional return
    fun optionalReturn(flag: Bool): Int? {
         if (flag) { return 123; }
         return null;
    }

    // Function with implicit final statement return (semicolon optional)
    fun semicolonTest(): Int {
         let a = 5;
         return a
    }

    // Function with return inside nested if block
    fun nestedIfReturn(x: Int): Int {
         if (x < 0) {
             { let y = -x; return y; }
         }
         return x;
    }

    // Function with return inside a loop block
    fun loopReturn(): Int {
         repeat (5) {
             if (true) { return 999; }
         }
         return 0;
    }
}

contract TestGetter {
    v: Int = 0;

    // Getter with conditional return value based on state variable
    get fun getPair(): Pair {
         if (self.v > 0) {
              return Pair { first: self.v, second: self.v + 10 };
         }
         return Pair { first: -1, second: -1 };
    }

    receive() {}
}

contract TestReceiverValid {
    // Valid receiver: no explicit return type allowed, hence implicit unit return
    receive() { }
}

// The following contracts are intentionally commented out because they are expected to produce compile errors
// due to mismatched return types or disallowed return behavior in receivers.

// contract TestMismatch {
//     fun mismatch(x: Int): Int {
//         if (x > 0) { return x; }
//         return false; // type mismatch: expected Int
//     }
// }

// contract TestReceiverReturnErr {
//     // Receivers cannot have an explicit return type
//     receive() -> Int { return 42; }
// }
