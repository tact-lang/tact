fun pureReturn(): Int {
    return 42;
}

fun tryReturnTest(): Int {
    try {
        return 1;
    } catch (e) {
        return 2;
    }
}

fun nestedTryReturn(): Int {
    try {
        try {
            throw(200);
        } catch (inner) {
            return inner + 1; // returns 201
        }
    } catch (outer) {
        return outer; // in case outer catch is reached
    }
    // Removed unreachable fallback return
    // Compiler may require a return, so add one that is reachable
    // But given all paths should have return, we add an unreachable error fallback commented out
    // return -1;
}

fun tryNoException(): Int {
    try {
        let a = 10;
        return a;
    } catch (e) {
        return e;
    }
}

fun loopInTry(): Int {
    try {
        repeat (3) {
            if (true) {
                return 123; // immediate return
            }
        }
    } catch (_) {
        return 2;
    }
    return 0; // fallback if loop does not return (the compiler cannot prove the loop always returns)
}

fun testCatchVariable(): Int {
    try {
        throw(300);
    } catch (err) {
        return err;
    }
    // No code after catch
}

fun conditionalReturn(): Int {
    try {
        let a = 5;
        if (a > 3) {
            return a * 2; // returns 10
        } else {
            return 0;
        }
    } catch (e) {
        return e;
    }
}

fun fallbackReturn(): Int {
    try {
        let b = 7;
    } catch (err) {
        return err;
    }
    return 42;
}

contract ControlFlowReceiver {
    receive() {
        try {
            throw(404);
        } catch (e) {
            dump(e); // should dump 404
            return;  // exit receive handler
        }
    }
}
