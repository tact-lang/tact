struct Pair { a: Int; b: Int }

contract Test {

    // Regular function: nested return in if/else
    fun funcNested(x: Int): Int {
        if (x > 10) {
            return 100;
        } else {
            return x;
        }
    }

    // Regular function: loop with early return
    fun loopReturn(): Int {
        let i: Int = 0;
        repeat (5) {
            if (i == 2) {
                return 42;
            }
        }
        return 0;
    }

    // Regular function: nested blocks with return
    fun nestedBlocks(x: Int): Int {
        {
            if (x == 0) {
                return 10;
            } else {
                {
                    if (x == 1) {
                        return 20;
                    }
                }
            }
        }
        return 30;
    }

    // Getter: return a struct
    get fun getPair(): Pair {
        let a: Int = 1;
        let b: Int = 2;
        if (a + b == 3) {
            return Pair { a: a, b: b };
        } else {
            return Pair { a: 0, b: 0 };
        }
    }

    // Getter: return an optional Int
    get fun getOptional(): Int? {
        if (true) {
            return 7;
        }
        return null;
    }

    // Receiver: testing return statement in receiver function
    receive (msg: Slice) {
        return;
    }
}
