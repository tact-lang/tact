contract TestOptionalReturn {
    // Function returning an optional Int
    fun maybeReturn(x: Int): Int? {
         if (x > 10) {
             return x;
         } else {
             return null;
         }
    }
}

contract TestComplexReturn {
    // Function with nested blocks and conditional early returns
    fun complexReturn(x: Int): Int {
         if (x > 10) {
             return x;
         } else if (x == 10) {
             { { return x * 2; } }
         } else {
             return 0;
         }
    }
}

contract TestTernaryReturn {
    // Function using the ternary operator for return
    fun ternaryReturn(x: Int): Int {
         return x > 0 ? x : -x;
    }
}
