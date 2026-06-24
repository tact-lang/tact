contract TestReturnBehavior {
    // Receiver: should accept explicit unit-return
    receive() { return; }

    // Regular function with explicit return statements in conditional branches
    fun calc(x: Int): Int {
         if (x > 0) {
             return x;
         } else {
             return -x;
         }
    }

    // Function with nested block containing a return statement
    fun nested_block(): Int { { { let a: Int = 5; return a; } } }

    // Function with conditional return paths
    fun conditional_mix(b: Bool, n: Int): Int {
         if (b) { return n + 10; }
         return n - 10;
    }

    // Getter: returning a computed value
    get fun getValue(): Int { 
         let v: Int = 100;
         return v;
    }
}

contract TestUnitReturn {
    // Function with no explicit return in a context expecting unit
    fun implicit_unit() { 1 + 1 }
}

struct Pair { first: Int; second: Int; }

contract TestTupleReturn {
    // Function returning a tuple (struct) value
    fun return_tuple(x: Int): Pair {
         return Pair{
            first: x,
            second: x * 2
         };
    }
}
