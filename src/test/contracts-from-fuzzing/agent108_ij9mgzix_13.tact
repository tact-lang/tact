struct MyStruct { a: Int; b: Int }

contract TestIfReturnWithBraces {
    // Function with if-return using braces
    fun simple(x: Int): Int {
         if (x > 10) { return x; }
         return x + 1;
    }
}

contract TestStructReturn {
    // Getter returning a struct with nested return in an if block
    get fun getStruct(): MyStruct {
         if (true) { return MyStruct{ a: 5, b: 10 }; }
         return MyStruct{ a: 0, b: 0 };
    }
}

contract TestWhileLoopReturn {
    // Function with a while loop that returns early when a condition is met
    fun loopReturn(x: Int): Int {
         let i = x;
         while (i > 0) {
             if (i == 3) { return 100 + i; }
             i = i - 1;
         }
         return 0;
    }
}

contract TestNestedBlockReturn {
    // Function with multiple nested blocks each containing a return
    fun nestedReturn(x: Int): Int {
         {
             {
                 if (x == 7) { return x * 10; }
             }
         }
         return x;
    }
}

contract TestChainedTernaryReturn {
    // Function using chained ternary operators
    fun chainedTernary(x: Int): Int {
         // If x is positive return x, if zero return 0, else return -x
         return x > 0 ? x : (x == 0 ? 0 : -x);
    }
}
