struct Pair { a: Int; b: Int; }

contract TestReturnValid {
    // Valid early return
    fun earlyReturn(x: Int): Int {
         if (x > 10) { return x; }
         return x + 1;
    }

    // Valid return from a nested block
    fun nestedReturn(x: Int): Int {
         {
            let y: Int = x + 2;
            if (y > 10) { return y; }
         }
         return x;
    }

    // Valid return from within a loop
    fun loopReturn(x: Int): Int {
         let i: Int = 0;
         let sum: Int = 0;
         while (i < x) {
             if (i == 3) { return i; }
             sum = sum + i;
             i = i + 1;
         }
         return sum;
    }

    // Valid implicit return with omitted semicolon
    fun implicitReturn(x: Int): Int {
         if (x > 0) { return x + 1 } else { return x - 1; }
    }

    // Valid getter returning a struct
    get fun getPair(): Pair {
         if (now() > 1000) { return Pair { a: 5, b: 6 }; } else { return Pair { a: 1, b: 2 }; }
    }

    // Valid getter returning an optional Int
    get fun getOptional(x: Bool): Int? {
         if (x) { return 42; } else { return null; }
    }

    // Valid receiver with no return value
    receive() {
         return;
    }
}
