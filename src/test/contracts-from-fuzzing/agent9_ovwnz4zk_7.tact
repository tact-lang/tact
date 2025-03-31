/* Additional fuzz tests for return statements in Tact, focusing on deeper edge-case scenarios */

// 15. Return inside multiple nested blocks and conditionals
fun deep_nested_return(x: Int): Int {
    {
        {
            if (x > 100) {
                return x - 50;
            } else {
                {
                    if (x < 0) {
                        return -x;
                    }
                }
            }
        }
    }
    return x;
}

// 16. Return using a ternary operator computed value
fun ternary_return(flag: Bool, a: Int, b: Int): Int {
    // Ternary operator used to decide the value to be returned
    return flag ? (a + b) : (a - b);
}

// 17. Return with nested returns inside a loop using repeat
fun loop_with_multiple_returns(n: Int): Int {
    let sum: Int = 0;
    // Using assignment statements, assuming variables can be updated
    // Note: In Tact, reassignment is permitted via the assignment operator
    repeat(n) {
        if (sum > 10) { 
            return sum; 
        }
        sum = sum + 1;
    }
    return sum;
}

// 18. Getter with a nested complex block involving multiple returns
contract ComplexGetter {
    v: Int = 20;
    get fun compute(): Int {
       {
         if (self.v == 20) {
             return self.v * 2;
         } else {
             // nested block with another condition
             {
                 if (self.v > 20) { 
                     return self.v - 5; 
                 }
             }
         }
       }
       return self.v;
    }
}

// 19. Receiver with a conditional return and subsequent code
contract ConditionalReceiver {
    receive() {
        if (true) {
            return; // should exit receiver
        }
        // Code here should be unreachable
        dump(999);
    }
}

// 20. Getter that returns a complex tuple (using a struct) with early return in a nested block
struct ComplexTuple { x: Int; y: Int; }

contract TupleGetter {
    value: Int = 8;
    get fun get_complex(): ComplexTuple {
       { 
           if (self.value % 2 == 0) { 
               return ComplexTuple { x: self.value, y: self.value * 2 };
           }
       }
       return ComplexTuple { x: self.value, y: self.value };
    }
}
