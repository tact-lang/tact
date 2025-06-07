struct MyStruct { a: Int; b: Int }

struct Pair2 { first: Int; second: Int }

// Function testing multiple return branches with nested explicit returns
fun multiReturnTest(x: Int): Int {
    if (x < 0) {
        return -x;
    } else if (x == 0) {
        { return 100; }
    } else {
        return x;
    }
}

// Function with a repeat loop that contains an early return based on an explicit counter
fun loopReturn2(n: Int): Int {
    let mutable: Int = 0;
    repeat (n) {
        if (mutable == 2) {
            return mutable;
        }
        mutable = mutable + 1;
    }
    return mutable;
}

// Function testing tuple returns, using a defined struct for the tuple
fun multiReturnTuple(x: Bool): Pair2 {
    if (x) {
        return Pair2 { first: 1, second: 2 };
    } else {
        return Pair2 { first: 3, second: 4 };
    }
}

contract ReturnTest3 {
    // Getter defined inside a contract, as required in Tact
    get fun getStruct(): MyStruct {
        if (true) {
            return MyStruct { a: 10, b: 20 };
        } else {
            return MyStruct { a: 30, b: 40 };
        }
    }

    // Receiver function; receivers do not return a value
    receive() {
        // Early return is allowed if needed
        if (false) {
            return;
        }
    }
}

// Function with a while loop: decrements a mutable until it reaches 0
fun whileTest(n: Int): Int {
    let mutable: Int = n;
    while (mutable > 0) {
        mutable = mutable - 1;
    }
    return mutable;
}

// do...until loop: executes block at least once
fun doUntilTest(n: Int): Int {
    let mutable: Int = n;
    do {
        mutable = mutable - 1;
    } until (mutable <= 0);
    return mutable;
}

// Operator precedence test with nested parentheses
fun precedenceTest(x: Int, y: Int): Int {
    return x + y * (x - y) + (x + y);
}

// Destructuring assignment: unpack a Point struct
struct Point { x: Int; y: Int }

fun destructuringTest(): Int {
    let Point { x, y } = Point { x: 5, y: 10 };
    return x + y;
}

// Augmented assignment operators test
fun augmentedTest(): Int {
    let mutable: Int = 10;
    mutable += 5;  // now 15
    mutable *= 2;  // now 30
    mutable -= 4;  // now 26
    return mutable;
}

// Repeat loop edge case test: using a mutable counter
fun repeatEdge(n: Int): Int {
    let counter: Int = 0;
    repeat (n) {
         counter = counter + 1;
    }
    return counter;
}
