fun controlTest() : Int {
    try {
        if (true) {
            return 1; // early return inside try
        }
        return 2; // this will never be reached
    } catch (e) {
        return 3; // fallback in case of exception
    }
}

fun testLoopTry() : Int {
    let i: Int = 0;
    repeat (3) {
        i += 1;
        if (i == 2) {
            return 200; // early return inside loop
        }
    }
    return i; // will return final value if loop finishes
}

fun nestedTryReturn() : Int {
    try {
        try {
            throw(300);
        } catch (e) {
            return e + 1; // should return 301
        }
    } catch (e) {
        return -1; // in case outer try catches an error
    }
}

fun tryWithoutCatch() : Int {
    try {
        if (false) { throw(400); } // does nothing
    }
    return 100; // normal execution path
}

fun main() {
    dump(controlTest());    // Expected: 1
    dump(testLoopTry());      // Expected: 200
    dump(nestedTryReturn());  // Expected: 301
    dump(tryWithoutCatch());  // Expected: 100
}
