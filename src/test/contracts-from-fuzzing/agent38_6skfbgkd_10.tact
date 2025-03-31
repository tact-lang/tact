struct Pair { a: Int; b: Int }

contract ReturnTestFuzz {
    x: Int;

    init() {
        self.x = 42;
    }

    // Function with early return inside a nested block
    fun nestedReturn(): Int {
        {
            if (self.x > 40) {
                return self.x;
            }
        }
        return -1;
    }

    // Function with return from inside a repeat loop
    fun loopReturn(): Int {
        repeat (5) {
            if (self.x == 42) {
                return 100;
            }
        }
        return 0;
    }

    // Function with multiple conditional returns
    fun multiReturn(x: Int): Int {
        if (x > 0) {
            return x;
        } else if (x == 0) {
            return 0;
        } else {
            return -x;
        }
    }

    // Getter function returning an optional Int
    get fun maybeX(): Int? {
        if (self.x > 50) {
            return self.x;
        } else {
            return null;
        }
    }

    // Getter function returning a struct
    get fun getPair(): Pair {
        if (self.x % 2 == 0) {
            return Pair { a: self.x, b: self.x / 2 };
        } else {
            return Pair { a: self.x, b: self.x * 2 };
        }
    }

    // Receiver function using an explicit return
    receive() {
         return;
    }
}
