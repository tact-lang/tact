struct Tuple { a: Int; b: Int; }

contract TestA {
    // Regular function with early and conditional returns
    fun foo(a: Int): Int {
        if (a > 0) {
            return a;
        } else {
            return -a;
        }
    }

    // Function with a return inside a loop block
    fun loopReturn(a: Int): Int {
        repeat (3) {
            if (a == 0) {
                return 42;
            }
        }
        return a;
    }

    // Function with a nested block return
    fun nestedBlock(a: Int): Int {
        {
            let x = a * 2;
            if (x > 10) {
                return x;
            }
        }
        return a;
    }

    // Getter returning a Tuple struct value
    get fun getTuple(): Tuple {
        if (self.getCounter() > 0) {
            return Tuple { a: self.getCounter(), b: self.getCounter() + 1 };
        } else {
            return Tuple { a: 0, b: 0 };
        }
    }

    // Dummy helper getter for state simulation
    get fun getCounter(): Int {
        return 5;
    }

    // Standard receiver with no return value
    receive() {}
}
