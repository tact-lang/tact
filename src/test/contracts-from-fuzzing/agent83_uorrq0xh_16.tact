struct Pair { a: Int; b: Int; }

contract DeepReturnTest {
    // Function with multiple branches and nested returns
    fun multi_branch(x: Int): Int {
        if (x == 0) {
            return 0;
        } else if (x < 0) {
            let sum: Int = 0;
            repeat (3) {
                if (x + sum == -2) {
                    return sum;
                }
                sum = sum + 1;
            }
            return -1;
        } else { // x > 0
            if (x == 1) {
                return 100;
            }
            { { return x + 10; } }
        }
    }
    
    // Function using ternary operator in the return
    fun ternary_return(x: Int): Int {
        return x > 5 ? (x * 2) : (x - 2);
    }
    
    // Function with nested loops and inner returns
    fun nested_loop_return(): Int {
        let i: Int = 0;
        repeat (3) {
            let j: Int = 0;
            repeat (2) {
                if (i + j == 2) {
                    return i * 10 + j;
                }
                j = j + 1;
            }
            i = i + 1;
        }
        return -999;
    }
    
    // Function that calls an assembly function
    fun asm_call(x: Int): Int {
        return asm_identity(x);
    }
    
    // Getter that returns the result of multi_branch invoked with a fixed value
    get fun getter_test(): Int {
        return self.multi_branch(2);
    }
    
    // Function with nested ternary expression
    fun nested_ternary(x: Int): Int {
        if (x > 0) {
            return x > 10 ? x * 3 : x * 2;
        } else {
            return x < -10 ? x * 4 : x * 5;
        }
    }
}

contract ReceiverTestValid {
    // Valid receiver function: receivers must not specify a return value
    receive() {
        dump(123);
        return;
    }
}

// Assembly function that acts as identity (no arrangement needed)
asm fun asm_identity(x: Int): Int { PUSHINT x; }
