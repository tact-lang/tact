struct Pair { a: Int; b: Int }

fun correctTupleReturn(x: Int): Pair {
   if (x > 10) {
     return Pair { a: x, b: x + 1 };
   } else {
     return Pair { a: x, b: x - 1 };
   }
}

// Also, function with explicit unit return (in a void function)
fun voidFunctionTest() {
   // return without value is allowed in functions with no return type (but Tact functions always have explicit return type?)
   return;
}

// Note: In Tact, functions without 'get' prefix must declare a return type. For functions that don't return a value,
// the return type is usually omitted, implying a void type. Thus, voidFunctionTest() is a procedure.
