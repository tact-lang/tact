/* Tact return statement fuzz tests focusing on various aspects of return behavior */

// 1. Basic return in a regular function
fun return_basic(): Int {
    return 42;
}

// 2. Early return in a function
fun early_return(x: Int): Int {
    if (x > 0) { 
        return x; 
    }
    return -x;
}

// 3. Return inside a nested block
fun nested_return(x: Int): Int {
    {
       if (x > 10) { 
           return x * 2; 
       }
    }
    return x;
}

// 4. Return inside a repeat loop block
fun loop_return(n: Int): Int {
    repeat(n) {
         if (n == 3) { 
             return 100; 
         }
    }
    return 0;
}

// 5. Multiple return paths with consistent types
fun multi_return(x: Bool): Int {
    if (x) { 
        return 1; 
    } else { 
        return 2;
    }
}

// 6. Return of a tuple value
struct Tuple { a: Int; b: Int; }

fun return_tuple(x: Int): Tuple {
    if (x > 10) { 
        return Tuple { a: x, b: x + 1 };
    }
    return Tuple { a: x, b: x - 1 };
}

// 7. Return statement without semicolon termination on last statement
fun no_semicolon(): Int {
    return 101
}

// 8. Return inside a nested block within an if condition
fun nested_in_if(x: Int): Int {
    if (x > 0) {
         { return x * 10; }
    }
    return 0;
}

// 9. Function with no specified return type (unit function) using return;
fun unit_return() {
    return;
}

// 10. Getter in a contract with a simple return
contract GetterContract {
    get fun get_value(): Int {
         return 10;
    }
}

// 11. Getter with conditional branches
contract ConditionalGetter {
   v: Int = 5;
   get fun computed(): Int {
       if (self.v > 0) { 
           return self.v; 
       } else { 
           return 0;
       }
   }
}

// 12. Getter with a nested block
contract NestedGetter {
   v: Int = 7;
   get fun nested(): Int {
       { if (self.v == 7) { return self.v + 3; } }
       return self.v;
   }
}

// 13. Receiver with a return statement
contract ReceiverReturn {
    receive() {
        return;
    }
}

// 14. Getter returning an optional struct
struct OptionalStruct { value: Int; }

contract OptionalGetter {
    get fun get_optional(flag: Bool): OptionalStruct? {
        if (flag) {
            return OptionalStruct { value: 123 };
        }
        return null;
    }
}
