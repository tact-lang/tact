struct Pair { a: Int; b: Int }

contract TestRegular {
    // Regular function with early return via nested block
    fun calc(a: Int, flag: Bool): Int {
         if (flag) {
              return a * 2;
         } else {
              { 
                  let b: Int = a + 10;
                  return b;
              }
         }
    }
}

contract TestNestedReturn {
    // Function using nested blocks to return early
    fun compute(x: Int): Int {
         { 
             { 
                  if (x < 5) {
                       return x * 2;
                  }
             }
         }
         return x + 10;
    }
}

contract TestLoopReturn {
    // Function that returns from within a loop
    fun nestedLoop(n: Int): Int {
         let res: Int = 0;
         repeat (n) {
             if (res == 3) {
                 return res + 100;
             }
             res = res + 1;
         }
         return res;
    }
}

contract TestGetter {
    v: Int = 0;  // initialize field

    // Getter returning a struct (tuple equivalent) with conditional branching
    get fun pair(): Pair {
         if (self.v > 10) {
             return Pair { a: self.v, b: self.v + 5 };
         } else {
             return Pair { a: 0, b: 0 };
         }
    }
}

contract TestReceiver {
    // Receiver function where return is allowed to end execution
    receive () {
         // Some preliminary code (omitted)
         return;
    }
}
