fun normalReturn() : Int {
    return 42;
}

fun earlyReturn() : Int {
    try {
        return 100;
    } catch (err) {
        return 200;
    }
}

fun nestedTryCatch() : Int {
    try {
        try {
            throw(101);
        } catch (err) {
            return err + 1;  // expected to return 102
        }
    } catch (err) {
        return err;
    }
}

fun catchWithReturn() : Int {
    try {
        throw(1042);
    } catch (err) {
        try {
            return err + 10; // expected to return 1052
        } catch (innerErr) {
            return 0;
        }
    }
}

fun loopReturn() : Int {
    repeat (5) {
        if (true) {
            return 10;
        }
    }
    return 0;
}

fun multiReturn(x: Int) : Int {
    if (x > 0) {
        return x;
    } else {
        return -x;
    }
}

fun tryInLoop(x: Int) : Int {
    repeat (x) {
        try {
            if (x == 1) {
                return 5;
            }
        } catch (err) {
            return 100;
        }
    }
    return 0;
}

fun complexReturn() : Int {
    try {
        try {
            throw(7);
        } catch (e) {
            if (e == 7) {
                return 7;
            }
            return 0;
        }
    } catch (_) {
        return 999;
    }
}

fun unreachableTest() : Int {
    return 1;
    // Unreachable code omitted
}

fun multipleBranches(x: Int) : Int {
    if (x < 0) {
        return -1;
    }
    if (x == 0) {
        try {
            throw(10);
        } catch (err) {
            return err;
        }
    }
    return x;
}

contract ReceiverTest {
    // Receiver to test early exit
    receive("msg") {
        if (true) {
            return;
        }
        // Unreachable code omitted
    }

    // Receiver with try-catch in message handler
    receive("test") {
        try {
            throw(1234);
        } catch (err) {
            dump(err);  // Should dump 1234
        }
    }

    // Receiver testing branching and nested try without forcing an early return
    receive("branch") {
        if (false) {
            dump("if branch");
        } else {
            try {
                if (false) {
                    return;
                }
            } catch (e) {
                dump(e);
            }
            dump("after try-catch");
        }
    }
}
