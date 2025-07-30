struct Pair { first: Int; second: Int }

contract ReturnFuzzing {
    // Test case: Regular function with early return
    fun earlyReturn(x: Int): Int {
         if (x > 0) { return x; }
         return -x;
    }

    // Test case: Nested block with return
    fun nestedBlockReturn(): Int {
         {
             let a = 42;
             if (a == 42) { return a; }
         }
         return 0;
    }

    // Test case: Function with multiple conditional returns
    fun multiReturn(x: Int): Int {
         if (x < 0) { return -x; }
         else if (x == 0) { return 0; }
         else { return x; }
    }

    // Test case: Return inside a loop and nested block
    fun loopNestedReturn(x: Int): Int {
         repeat (3) {
             if (x == 10) { return 10; }
             { if (x < 5) { return x * 2; } }
         }
         return 100;
    }

    // Test case: Function with implicit unit return
    // This function returns unit implicitly
    fun implicitUnit() { /* no return statement, returns unit */ }

    // Getter: Conditional return with computed Pair
    get fun computedPair(): Pair {
         if (self.value > 20) { return Pair { first: self.value, second: self.value - 1 };
         }
         return Pair { first: self.value, second: self.value + 1 };
    }

    // State variable for getter
    value: Int = 25;

    // Receiver: Valid receiver without explicit return type
    receive() { }

    // Test case: Function with return in nested if block
    fun nestedIfReturn(x: Int): Int {
         if (x < 0) {
             { let y = -x; return y; }
         }
         return x;
    }

    // Test case: Final expression function (explicit return added to avoid missing return error)
    fun finalExpression(): Int {
         let a = 7;
         return a;
    }
}
