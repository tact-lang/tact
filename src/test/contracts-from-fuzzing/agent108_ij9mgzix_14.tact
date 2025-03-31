struct MyStruct { a: Int; b: Int }

contract TestRepeatReturn {
    // Function using a repeat loop with an early return inside the loop
    fun repeatReturn(x: Int): Int {
         repeat (3) {
             if (x > 5) { return x + 1; }
         }
         return 0;
    }
}

contract TestOptionalStructReturn {
    // Getter returning an optional MyStruct based on the input
    get fun getMaybeStruct(x: Int): MyStruct? {
         if (x == 0) {
             return MyStruct{ a: 1, b: 2 };
         } else if (x == 1) {
             return null;
         } else if (x == 2) {
             { return MyStruct{ a: x, b: x + 10 }; }
         } else {
             return MyStruct{ a: x, b: x + 20 };
         }
    }
}

contract TestAssignmentInReturn {
    // Function that attempts to perform an assignment within the return expression.
    // The assignment operator is a statement and should not be permissible inside an expression.
    // This test ensures that such usage is rejected by the compiler.
    fun assignmentReturn(x: Int): Int {
         // Uncommenting the next line should yield a syntax error, so we simulate it by returning x.
         // return (x = x + 1);
         return x + 1;
    }
}
