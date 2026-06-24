struct Pair {
    a: Int;
    b: Int;
}

contract ValidReturns {
    // Returns a constant value
    fun constant(): Int {
         return 100;
    }

    // Returns absolute value of x using conditional return
    fun conditional(x: Int): Int {
         if (x > 0) {
             return x;
         } else {
             return -x;
         }
    }

    // Returns from within a nested block
    fun nested(): Int {
         {
              let a: Int = 5;
              if (a > 3) {
                  return a * 2;
              }
         }
         return 0;
    }

    // Uses a repeat loop with an early return
    fun early_repeat(): Int {
         let acc: Int = 0;
         repeat (5) {
              // Each iteration increments acc
              acc += 1;
              if (acc == 3) {
                  return acc;
              }
         }
         return acc;
    }

    // Void function with an explicit return
    fun noReturnVoid() {
         return;
    }
}

contract ValidGetterReceiver {
    v: Int = 10;

    // Getter that returns a struct, simulating tuple return
    get fun getPair(): Pair {
         if (self.v % 2 == 0) {
             return Pair{ a: self.v, b: self.v + 100 };
         } else {
             return Pair{ a: self.v, b: self.v - 100 };
         }
    }

    // Receiver that explicitly returns
    receive(msg: Slice) {
         return;
    }
}
