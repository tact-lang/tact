fun testReturn(x: Int): Int {
    // Regular function with early return
    if (x > 10) {
        return x;
    }
    {
        // Return from a nested block
        return x + 1;
    }
}

fun loopReturn(n: Int): Int {
    // Loop with a return inside the repeat block
    repeat (n) {
        if (n == 2) {
            return n;
        }
    }
    return 0;
}

struct Pair {
    a: Int;
    b: Int;
}

contract TestGetter {
    // State variable initialized
    v: Int = 5;

    // Getter that returns a Pair based on a condition using nested returns
    get fun getPair(): Pair {
        if (self.v > 10) {
            return Pair { a: self.v, b: self.v + 1 };
        }
        {
            // Even though getter can modify variables, changes won't be stored
            return Pair { a: self.v + 1, b: self.v + 2 };
        }
    }
}

contract TestReceiver {
    // Receiver functions can only accept message, Slice, or String.
    // Here, we take a Slice message and use return statements
    v: Int = 0;

    receive(msg: Slice) {
        // Use Slice.bits() to decide whether to return early
        if (msg.bits() == 0) {
            return;
        }
        {
            // Return from inside a nested block within receiver
            return;
        }
    }
}
