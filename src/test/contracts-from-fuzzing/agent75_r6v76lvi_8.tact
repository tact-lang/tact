struct Pair { first: Int; second: Int }

// Regular function with early return
fun earlyReturn(x: Int): Int {
    if (x < 10) {
        return x * 2;
    } else {
        return x;
    }
}

// Function with a nested block containing an unconditional return
fun nestedReturn(): Int {
    { return 42; }
}

// Function with a return inside a loop using an explicit counter
fun loopReturn(x: Int): Int {
    let mutableCounter: Int = 0;
    repeat (5) {
        if (x == mutableCounter) {
            return mutableCounter;
        }
        mutableCounter = mutableCounter + 1;
    }
    return -1;
}

// Function returning an optional Int
fun optionalReturn(x: Int): Int? {
    if (x > 100) {
        return x;
    }
    return null;
}

contract ReturnTest {
    // Getter, as per documentation, must be defined inside a contract
    get fun getPair(cond: Bool): Pair {
        if (cond) {
            return Pair { first: 1, second: 2 };
        } else {
            return Pair { first: 3, second: 4 };
        }
    }

    // Receiver function; a return without a value is allowed
    receive() {
        if (false) {
            return;
        }
    }
}
