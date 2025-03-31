struct Pair { first: Int; second: Int; }

contract ReturnFuzzComplex {
    // Function with nested if-else and block return
    fun nestedIfReturn(a: Int, b: Int): Int {
         if (a > b) {
             { let diff: Int = a - b; return diff; }
         } else if (a < b) {
             return b - a;
         } else {
             return 0;
         }
    }

    // Function with early return inside a repeat loop
    fun repeatReturn(n: Int): Int {
         repeat (n) {
            if (n % 2 == 0) {
               return n / 2;
            }
         }
         return -999;
    }

    // Function with foreach loop over a map and nested block return
    fun foreachReturn(): Int {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 10);
         m.set(2, 20);
         m.set(3, 30);
         foreach (key, value in m) {
             if (value == 20) {
                 { return value + 7; }
             }
         }
         return -1;
    }

    // Function returning an optional value
    fun optionalReturn(flag: Bool): Int? {
         if (flag) {
             { return 777; }
         }
         return null;
    }

    // Function with deeply nested block returns
    fun deepNestedReturn(x: Int): Int {
         { { if (x > 100) { return x - 100; } else { { if (x > 50) { return x - 50; } } } } }
         return 0;
    }

    // Getter using Pair struct with nested conditionals
    get fun computedPair(): Pair {
         if (self.nestedIfReturn(15, 10) > 0) {
             return Pair{ first: self.repeatReturn(8), second: self.foreachReturn() };
         }
         return Pair{ first: 111, second: 222 };
    }

    // Receiver function returning unit via explicit return
    receive () {
         return;
    }
}
