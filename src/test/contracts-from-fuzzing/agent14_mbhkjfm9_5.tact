fun positiveReturn(): Int {
    return 42;
}

fun earlyReturn(b: Bool): Int {
    if (b) { 
        return 1;
    }
    return 0;
}

fun catchTest(): Int {
    try {
        throw(101);
    } catch (err) {
        return err;
    }
}

fun nestedTryCatch(): Int {
    try {
        try {
            throw(102);
        } catch (innerErr) {
            return innerErr + 1;
        }
    } catch (outerErr) {
        return outerErr + 2;
    }
    // All code paths return; no need for additional return
}

fun returnInsideCatch(): Int {
    try {
        throw(200);
    } catch (err) {
        return err * 2;
    }
    // unreachable
}

contract ReceiverCF {
    receive("test") {
        try {
            throw(300);
        } catch (err) {
            return;
        }
    }
}

fun calledThrow(): Int {
    throw(404);
}

fun callerTryCatch(): Int {
    try {
        return calledThrow();
    } catch (err) {
        return err;
    }
}

fun complexControlFlow(a: Int): Int {
    try {
        if (a > 0) {
            return a;
        } else if (a == 0) {
            throw(500);
        } else {
            return -a;
        }
    } catch (err) {
        return err;
    }
}

fun tryNoCatch(): Int {
    try {
        let a: Int = 5;
    }
    return 10;
}

fun tryCatchWithMultipleReturns(): Int {
    try {
        if (true) { 
            return 11; 
        }
    } catch (err) {
        return err;
    }
    return 0;
}

fun loopReturn(): Int {
    try {
        repeat (3) {
            if (true) { 
                return 2; 
            }
        }
        return 0;
    } catch (err) {
        return err;
    }
}

fun nestedReturnCatch(): Int {
    try {
        try {
            throw(7);
        } catch (innerErr) {
            try {
                if (innerErr == 7) { 
                    return 100; 
                } else { 
                    throw(8); 
                }
            } catch (nestedErr) {
                return nestedErr;
            }
        }
    } catch (outerErr) {
        return outerErr;
    }
    // All paths consistently return;
}

contract ReceiverNested {
    receive("chain") {
        try {
            if (sender() == myAddress()) {
                return;
            } else {
                throw(404);
            }
        } catch (err) {
            return;
        }
    }
}

fun complexReturns(x: Int): Int {
    if (x > 10) {
        try {
            if (x > 100) { throw(1); }
            return x - 10;
        } catch (e) {
            return e + 10;
        }
    } else {
        return x + 10;
    }
}
