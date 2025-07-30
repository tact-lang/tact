contract ReturnTests {
    // State variable for getter modification tests
    v: Int;

    // Constructor
    init() {
        self.v = 0;
    }

    // 1. Basic return in a regular function
    fun basicReturn() : Int {
        return 42;
    }

    // 2. Early return from a conditional block
    fun earlyReturn(flag: Bool) : Int {
        if (flag) {
            return 1;
        }
        return 2;
    }

    // 3. Return from inside a nested block
    fun nestedBlockReturn() : Int {
        {
            let x: Int = 10;
            return x;
        }
    }

    // 4. Return with implicit semicolon for the last statement
    fun implicitSemicolon() : Int {
        return 100
    }

    // 5. Returning from inside a loop block
    fun loopReturn() : Int {
        repeat (3) {
            if (1 == 1) {
                return 99;
            }
        }
        return 0;
    }

    // 6. A getter with conditional return
    get fun getterTest() : Int {
        if (now() > 1000) {
            return 42;
        } else {
            return 24;
        }
    }

    // 7. A getter that modifies state (modification is not persisted after execution)
    get fun getterMod() : Int {
        self.v = self.v + 1;
        return self.v;
    }

    // 8. Function with no return type (unit-like behavior)
    fun returnUnit() {
        return;
    }

    // 9. Multiple return paths with identical types
    fun multiReturn(flag: Bool) : Int {
        if (flag) {
            return 10;
        } else {
            return 20;
        }
    }

    // 10. Return from deep nested blocks
    fun deepReturn(x: Int) : Int {
        if (x > 0) {
            {
                if (x > 10) {
                    return 100;
                }
            }
        }
        return -1;
    }

    // 11. Using a ternary operator inside return
    fun ternaryReturn(cond: Bool) : Int {
        return cond ? 1 : 0;
    }

    /*
    // The following functions are intentionally commented out because they are
    // expected to generate compilation errors due to invalid usage of return:
    
    // 12. Receiver functions should not return a value
    receive() {
        return 42; // Expected error: receivers cannot have a return value
    }

    // 13. Mismatched return type: returns a Cell for a function declared to return Int
    fun wrongReturn() : Int {
        return emptyCell(); // Expected error: type mismatch
    }
    */
}
