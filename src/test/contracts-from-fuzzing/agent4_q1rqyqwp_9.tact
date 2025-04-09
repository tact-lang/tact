struct Pair { a: Int; b: Int }

message M { v: Int as uint32; }

contract ValidReturnTests {
    // Getter with conditional returns inside contract
    get fun getterCond(x: Int): Pair {
        if (x % 2 == 0) {
            return Pair{ a: x, b: x + 2 };
        } else {
            return Pair{ a: x, b: x - 2 };
        }
    }

    // Valid receiver: accepts message M and uses void return
    receive(msg: M) {
        if (msg.v > 10) {
            return;
        }
        dump(msg.v);
    }
}

// Regular function with simple return
fun simpleReturn(): Int {
    return 42;
}

// Function with nested return inside a block
fun nestedReturn(x: Int): Int {
    if (x > 10) {
        return x;
    }
    {
       let y = x + 1;
       return y;
    }
}

// Function with conditional return using if-else
fun conditionalReturn(x: Int): Int {
    if (x > 0) {
        return x;
    } else {
        return -x;
    }
}

// Function with explicit return
fun explicitReturn(): Int {
    return 99;
}

// Function with early return inside a loop
fun earlyLoopReturn(): Int {
    repeat (3) {
        if (true) {
            return 7;
        }
    }
    return 42;
}

// Function returning unit
fun retUnit() {
    return;
}

// Function with multiple return paths
fun multiPath(x: Int): Int {
    if (x > 0) {
        if (x > 10) {
            return 100;
        } else {
            return 50;
        }
    } else {
        return -1;
    }
}

// Function with explicit return even for a literal expression (no implicit return)
fun implicitReturn(): Int {
    return 99;
}
