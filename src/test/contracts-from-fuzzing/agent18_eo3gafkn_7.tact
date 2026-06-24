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
            return inner + 1; // expected: 201
        }
    } catch (outer) {
        return outer; // fallback
    }
    // All paths handled with returns
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
    return 0; // fallback
}

fun testCatchVariable(): Int {
    try {
        throw(300);
    } catch (err) {
        return err; // should return 300
    }
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

fun nestedTryThrow(): Int {
    try {
        try {
            throw(10);
        } catch (inner) {
            throw(inner + 1); // rethrow with 11
        }
    } catch (outer) {
        return outer; // should return 11
    }
}

fun controlFlowChain(): Int {
    if (true) {
        try {
            if (false) {
                return 1; // not executed
            } else {
                return 2; // always executed
            }
        } catch (e) {
            return e;
        }
    } else {
        return 3;
    }
}

fun tryNoCatchTest(): Int {
    try {
         let a = 5;
         // no exception thrown
    } catch (e) {
         return e;
    }
    return 100;
}

contract ControlFlowComplex {
    receive() {
         if (false) {
              dump(100);
         } else {
              try {
                  throw(777);
              } catch (error) {
                  dump(error); // should dump 777
                  return;      // exit handler
              }
         }
         // Further code could be placed here if reachable
         dump(42); // This dump is reachable only if the above try-catch didn't return
    }
}
