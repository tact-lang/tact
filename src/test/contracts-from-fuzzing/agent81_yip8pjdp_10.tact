struct Pair { a: Int; b: Int; }

fun testImplicit(i: Int): Int {
    if (i > 0) { return i } else { return -i }
}

fun testLoop(n: Int): Int {
    repeat(n) {
        if (n == 3) { return 42 }
    }
    return 0
}

contract TestContract {
    v: Int = 0;

    // Receiver with no parameters
    receive() {
        if (self.v == 0) { return }
        dump(self.v);
    }

    // Getter returning a Pair struct with conditional return
    get fun getTuple(): Pair {
        if (self.v > 10) { return Pair { a: self.v, b: self.v + 1 } } else { return Pair { a: self.v, b: self.v - 1 } }
    }

    // Getter that returns an Int based on the contract state
    get fun getValue(): Int {
         if (self.v < 0) { return 0 } else { return self.v }
    }
}

fun main() {
    dump(testImplicit(-7));  // expected: 7
    dump(testLoop(3));       // expected: 42
    dump(0);
}
