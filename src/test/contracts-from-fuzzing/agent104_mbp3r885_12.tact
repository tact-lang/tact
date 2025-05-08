struct Pair { a: Int; b: Int }

// Test 1: Regular function with nested return statements
fun testReturnNested(x: Int): Int {
    if (x > 10) {
        return x + 1;
    } else {
        if (x < 0) {
            { return 0; }  // Nested block with early return
        } else {
            return x * 2;
        }
    }
}

// Test 2: Getter returning a struct based on a condition
contract P {
    get fun getPair(cond: Bool): Pair {
        if (cond) {
            return Pair { a: 1, b: 2 };
        } else {
            return Pair { a: 3, b: 4 };
        }
    }
}

// Test 3: Receiver that uses an early return; note: use bits() instead of len()
contract RValid {
    receive(msg: Slice) {
        // Checking if the slice has any data bits
        if (msg.bits() > 0) {
            return;
        }
        return;
    }
}

fun main() {
    // Test function returns
    let a = testReturnNested(15);  // Expected: 16
    let b = testReturnNested(-5);  // Expected: 0
    let c = testReturnNested(5);   // Expected: 10
    return;
}
