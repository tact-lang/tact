// Fuzzing Return Statements in Tact - Valid Cases Only

// Test A: Simple return in a regular function
fun simpleReturn(): Int {
    return 42;
}

// Test B: Early return in an if-else block in a regular function
fun earlyReturn(x: Int): Int {
    if (x > 0) {
        return x;
    } else {
        return -x;
    }
}

// Test C: Return from within a repeat loop inside a function
fun loopReturn(n: Int): Int {
    repeat(n) {
        if (n > 5) {
            return n;
        }
    }
    return 0;
}

// Test D: Function with nested blocks with return
fun nestedBlockReturn(x: Int): Int {
    {
        if (x > 10) {
            return 100;
        }
    }
    return 0;
}

// Test E: Function with nested loops with return
fun nestedLoopReturn(): Int {
    repeat(3) {
        repeat(2) {
            if (true) {
                return 123;
            }
        }
    }
    return 456;
}

// Test F: Function returning a tuple via a struct
struct Pair {
    first: Int;
    second: Int;
}

fun returnPair(): Pair {
    return Pair{ first: 10, second: 20 };
}

// Test G: Function returning an optional Int value
fun optionalReturn(): Int? {
    return null;
}

// Contract with getters and receiver to check return behavior
contract TestReturnBehavior {
    data: Int = 5;

    // Getter with multiple nested returns and conditional branches
    get fun getDouble(): Int {
        if (self.data == 0) {
            return 0;
        }
        {
            if (self.data > 5) {
                return self.data * 2;
            }
        }
        return self.data;
    }

    // Receiver: uses return in nested blocks; allowed because receiver returns unit
    receive() {
        if (self.data < 10) {
            return;
        }
        {
            let a = 1;
            return;
        }
    }
}
