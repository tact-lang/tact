struct Pair { a: Int; b: Int; }

// Function testing early return using a nested block
fun nestedEarlyReturn(i: Int): Int {
    { // first nested block
        { // second nested block
            if (i > 0) { return 99 }
        }
    }
    return 0
}

// Function testing if-else returns without extraneous semicolons
fun simpleReturn(i: Int): Int {
    if (i < 0) { return -i } else { return i }
}

// Function utilizing a repeat loop with an early return
fun loopReturn(n: Int): Int {
    repeat(n) {
        // Early exit if n equals 3
        if (n == 3) { return 42 }
    }
    return 0
}

// Function returning an optional Int
fun optionalReturn(flag: Bool): Int? {
    if (flag) { return 1 } else { return null }
}

// Contract to test return behavior in receivers and getters
contract TestContract {
    v: Int = 7;

    // Receiver with no parameters that uses an empty return statement
    receive() {
        if (self.v < 5) { return }
        dump(self.v);
    }

    // Getter returning a Pair struct with conditional branches
    get fun getPair(): Pair {
        if (self.v > 10) { 
            return Pair { a: self.v, b: self.v + 1 }
        } else {
            return Pair { a: self.v, b: self.v - 1 }
        }
    }

    // Getter that returns an Int based on the contract state
    get fun getValue(): Int {
        if (self.v < 0) { return 0 } else { return self.v }
    }
}

// Main function to trigger tests and dump outputs
fun main() {
    dump(nestedEarlyReturn(5));    // Expected: 99
    dump(nestedEarlyReturn(-3));   // Expected: 0
    dump(simpleReturn(10));        // Expected: 10
    dump(simpleReturn(-12));       // Expected: 12
    dump(loopReturn(3));           // Expected: 42
    dump(loopReturn(5));           // Expected: 0
    dump(optionalReturn(true));    // Expected: 1
    dump(optionalReturn(false));   // Expected: null
    dump(0);
}
