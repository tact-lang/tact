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
