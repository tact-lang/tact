/// Comprehensive fuzz-testing snippet for return statements and control flow

// Define some auxiliary structs
struct MyStruct { a: Int; b: Int }
struct Pair2 { first: Int; second: Int }
struct Point { x: Int; y: Int }

// Function using multiple return branches with nested blocks and ternary
fun ternaryReturn(cond: Bool): Int {
    // Use ternary operator in return expression
    return cond ? 42 : 24;
}

// Function with complex control flow: while, do...until, and repeat loops
fun complexControlFlow(n: Int): Int {
    let counter: Int = n;
    // Use a while loop to decrement a local copy
    let local: Int = n;
    while (local > 0) {
        local = local - 1;
    }
    // Use do...until: guarantees one execution
    let du: Int = n;
    do {
        // subtract one each iteration
        du = du - 1;
    } until (du <= 0);
    // Use a repeat loop to increment a value
    let rep: Int = 0;
    repeat (n) {
         rep = rep + 1;
    }
    // Combine results using ternary operator
    return (local + du + rep) > 0 ? local + du + rep : 0;
}

// Function demonstrating destructuring assignment from a struct
fun destructuringTest(): Int {
    let Point { x, y } = Point { x: 5, y: 10 };
    return x + y;
}

// Function testing augmented assignments
fun augmentedTest(): Int {
    let mutable: Int = 10;
    mutable += 5;  // now 15
    mutable *= 2;  // now 30
    mutable -= 7;  // now 23
    mutable /= 2;  // integer division: 11 (since 23/2 = 11 truncating remainder)
    return mutable;
}

// Function testing multiple return paths including nested returns
fun multiReturnTest(x: Int): Int {
    if (x < 0) {
        return -x;
    } else if (x == 0) {
        { return 100; }
    } else {
        return x;
    }
}

// Function testing repeat loop with early return
fun loopReturnTest(n: Int): Int {
    let mutable: Int = 0;
    repeat (n) {
        if (mutable == 2) {
            return mutable;
        }
        mutable = mutable + 1;
    }
    return mutable;
}

// Function testing tuple-like return using a struct
fun multiReturnTuple(x: Bool): Pair2 {
    if (x) {
        return Pair2 { first: 1, second: 2 };
    } else {
        return Pair2 { first: 3, second: 4 };
    }
}

contract FuzzReturnTest {
    // Getter must be defined inside a contract
    get fun getStruct(): MyStruct {
        if (true) {
            return MyStruct { a: 10, b: 20 };
        } else {
            return MyStruct { a: 30, b: 40 };
        }
    }

    // Receiver function that simply does nothing
    receive() {
        // Receivers don't return a value
    }
}

// Entry point to call several functions and dump results for testing
fun mainTest(): Int {
    let a = ternaryReturn(true);         // should be 42
    let b = complexControlFlow(5);         // compute based on loops
    let c = destructuringTest();           // should be 15
    let d = augmentedTest();               // should be 11
    let e = multiReturnTest(0);            // should be 100
    let f = loopReturnTest(5);             // should return early when counter==2
    let pair = multiReturnTuple(true);     
    // Sum up some values from pair
    let g = pair.first + pair.second;      // should be 3 if true returns (1,2)
    return a + b + c + d + e + f + g;
}

// Call mainTest as a final side-effect wrapper
fun main(): Int {
    return mainTest();
}
