contract TestReturns {

    // State variable initialization
    v: Int = 0;

    // Test 1: Regular function with early return
    fun earlyReturn(x: Int): Int {
        if (x < 0) {
            return -1;
        }
        return x;
    }

    // Test 2: Regular function with nested block and inner return
    fun nestedBlockReturn(x: Int): Int {
        {
            if (x == 0) {
                return 42;
            }
        }
        return x;
    }

    // Test 3: Regular function with loop containing a return
    fun loopReturn(x: Int): Int {
        repeat (3) {
            if (x == 2) {
                return 100;
            }
        }
        return x;
    }

    // Test 4: Function returning an optional Int
    fun optReturn(x: Int): Int? {
        if (x > 10) {
            return x;
        }
        return null;
    }

    // Test 5: Function with explicit final expression return
    fun explicitReturn(x: Int): Int {
        let y: Int = x * 2;
        return y;
    }

    // Test 6: Getter with conditional return and complex expression
    get fun getV(): Int {
        if (self.v > 10) {
            return self.v;
        } else {
            let temp: Int = self.v + 10;
            return temp;
        }
    }

    // Test 7: Receiver without return value (return is disallowed in receivers)
    receive(msg: Slice) {
        // Return is disallowed in receivers; using dump instead
        dump(0);
    }

    // Test 8: Function with multiple return paths using nested structures
    fun multiPathReturn(x: Int, flag: Bool): Int {
        if (flag) {
            if (x < 0) {
                return -100;
            } else {
                let interim = x + 50;
                return interim;
            }
        } else {
            repeat (2) {
                if (x == 0) {
                    return 999;
                }
            }
            return x - 10;
        }
    }

}
