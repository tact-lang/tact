struct Triple { a: Int; b: Int; c: Int; }

contract FuzzReturn {
    // Function using 'repeat' loop with early return
    fun repeat_return(n: Int): Int {
         repeat (n) {
             if (n == 5) { return 42; }
         }
         return 0;
    }

    // Function with nested conditionals
    fun multi_branch(x: Int): Int {
         if (x < 0) {
              return -1;
         } else {
              if (x == 0) { return 0; } else { return 1; }
         }
    }

    // Function with nested block returning a value
    fun nested_scope_return(x: Int): Int {
         { let y: Int = x * 2; return y; }
    }

    // Function combining nested blocks and conditionals
    fun complex_return(x: Int): Int {
         if (x % 2 == 0) {
             { let z: Int = x / 2; return z; }
         } else {
             { let z: Int = (x + 1) / 2; return z; }
         }
    }

    // Function using a helper for recursion to simulate a while loop
    fun while_return(n: Int): Int {
         return helper(0, n);
    }
}

// Top-level recursive helper function
fun helper(i: Int, n: Int): Int {
    if (i >= n) { return n; }
    if (i == 3) { return i; }
    return helper(i + 1, n);
}

contract FuzzTupleReturn {
    // Function returning a tuple (struct) with multiple return paths
    fun return_triple(x: Int): Triple {
         if (x > 10) {
             return Triple{
                 a: x,
                 b: x + 1,
                 c: x + 2
             };
         }
         return Triple{
             a: 0,
             b: 0,
             c: 0
         };
    }
}
