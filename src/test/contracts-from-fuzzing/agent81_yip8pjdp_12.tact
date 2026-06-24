struct Pair { a: Int; b: Int; }

// Function with early return in different blocks
fun testEarly(i: Int): Int {
    if (i > 10) { return i }
    { let x = i + 5; return x }
}

// Function returning an optional Int
fun testOptional(b: Bool): Int? {
    if (b) { return 1 } else { return null }
}

// Function utilizing a repeat loop with an early return
fun testLoop(n: Int): Int {
    repeat(n) {
        // Return immediately if condition met
        if (n == 3) { return 42 }
    }
    return 0
}

// Contract to test return behavior in receivers and getters
contract TestContract {
    v: Int = 7;

    // Receiver with an empty return statement based on a condition
    receive() {
        if (self.v < 5) { return }
        dump(self.v);
    }

    // Getter returning a Pair struct with conditional branches
    get fun getPair(): Pair {
        if (self.v > 10) { return Pair { a: self.v, b: self.v + 1 } } else { return Pair { a: self.v, b: self.v - 1 } }
    }

    // Getter returning an Int based on contract state
    get fun getValue(): Int {
        if (self.v < 0) { return 0 } else { return self.v }
    }
}

// Main function to trigger tests
fun main() {
    dump(testEarly(5));         // Expected output: 10
    dump(testEarly(15));        // Expected output: 15
    dump(testOptional(true));   // Expected output: 1
    dump(testOptional(false));  // Expected output: null
    dump(testLoop(3));          // Expected output: 42
    dump(0);
}
