struct ReturnStruct {
    a: Int;
    b: Int;
}

contract ValidReturnTests {
    // Returns from within a repeat loop inside nested blocks
    fun loopReturn(): Int {
         repeat (5) {
            if (true) {
                {
                    let x: Int = 42;
                    return x;
                }
            }
         }
         return 0;
    }

    // Returns from within a nested block
    fun nestedReturn(): Int {
         {
             let y: Int = 30;
             if (y == 30) { 
                 return y; 
             }
         }
         return -1;
    }

    // Returns an optional Int using a ternary expression
    fun optionalReturn(a: Int): Int? {
         return a > 0 ? a : null;
    }

    // Explicitly returns unit
    fun unitReturn() {
         return;
    }

    // Getter with conditional return of a complex struct using self.loopReturn()
    get fun getterReturn(): ReturnStruct {
         if (self.loopReturn() == 42) {
             return ReturnStruct { a: 10, b: 20 };
         } else {
             return ReturnStruct { a: 1, b: 2 };
         }
    }

    // Receiver function using return statement
    receive () {
        if (true) {
            return;
        }
    }
}
