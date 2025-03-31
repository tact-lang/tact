struct Pair { a: Int; b: Int; }

contract ReturnBehavior {
    // Simple function returning Int
    fun simpleReturn(): Int {
         return 42;
    }

    // Early return with nested block
    fun earlyReturn(x: Int): Int {
         if (x > 0) {
              return x;
         }
         return -x;
    }
    
    // Function with multiple nested returns
    fun nestedReturn(x: Int): Int {
         if (x == 0) {
             return 0;
         } else {
             if (x > 0) {
                return x;
             }
             return -x;
         }
    }
    
    // Function with return inside a repeat loop
    fun loopReturn(x: Int): Int {
         repeat (10) {
             if (x > 5) {
                return x;
             }
         }
         return 0;
    }
    
    // Getter function returning a struct with nested block return
    get fun getPair(): Pair {
         if (true) {
              return Pair { a: 10, b: 20 };
         } else {
              return Pair { a: -1, b: -1 };
         }
    }
    
    // Receiver function with early return
    receive() {
         if (2 + 2 == 4) {
             return;
         }
         dump("This should not happen.");
    }
}

contract OptionalReturn {
    fun maybeReturn(x: Int): Int? {
         if (x > 10) {
             return x;
         }
         return null;
    }
    receive() {}
}

contract UnitReturnTest {
    // A function with no declared return type, which allows an implicit unit return
    fun unitReturn() {
         return; 
    }
    receive() {}
}
