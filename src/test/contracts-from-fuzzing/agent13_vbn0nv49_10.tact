struct Tuple2 {
    fst: Int;
    snd: Int;
}

contract ReturnFuzzTest {
    flag: Bool;
    a: Int;
    b: Int;

    init() {
        self.flag = true;
        self.a = 5;
        self.b = 10;
    }

    // Test 1: Simple early return
    fun simpleReturn(x: Int): Int {
        if (x > 10) {
            return x;
        }
        return 0;
    }

    // Test 2: Nested block return
    fun nestedReturn(): Int {
        { { return 42; } }
    }

    // Test 3: Recursive function using self call
    fun loopReturn(n: Int): Int {
        if (n <= 0) {
            return 0;
        }
        return self.loopReturn(n - 1);
    }

    // Test 4: Getter with conditional return
    get fun getterReturn(): Int {
        if (self.flag) {
            return 100;
        }
        return -100;
    }

    // Test 5: Getter returning a tuple via a struct
    get fun getterTuple(): Tuple2 {
        if (self.a > self.b) {
            return Tuple2 { fst: self.a, snd: self.b };
        }
        return Tuple2 { fst: self.b, snd: self.a };
    }

    // Test 6: Receiver with an explicit return using valid parameter type (Slice)
    receive(msg: Slice) {
        // If the message slice has a bit length greater than 5, return immediately.
        if (msg.bits() > 5) {
            return;
        }
        // Otherwise, continue (no further action).
    }

    // Test 7: Function returning an optional Int
    fun optionalReturn(x: Int): Int? {
        if (x % 2 == 0) {
            return null;
        }
        return x;
    }

    // Test 8: Function with multiple conditional return paths
    fun multiPathReturn(x: Int): Int {
        if (x < 0) {
            return -1;
        } else if (x == 0) {
            return 0;
        } else {
            return x;
        }
    }

    // Test 9: Unit function with explicit return (removed unreachable code)
    fun unitFunction() {
        return;
    }
}
