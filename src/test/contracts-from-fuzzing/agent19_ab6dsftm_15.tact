/// Comprehensive Fuzz-Testing: Expanding our exploration

// Contract testing state modifications in getter functions
contract GetStateTest {
    // A state variable initialized to 100
    state: Int = 100;

    // A getter function that modifies the state (changes won't persist after TVM run)
    get fun incState() : Int {
        self.state = self.state + 50;
        return self.state;
    }

    // A regular (non-getter) function modifying the state normally
    fun notGetterInc() : Int {
        self.state = self.state + 50;
        return self.state;
    }
}

// Assembly function using a valid TVM instruction; note DEPTH must be uppercase
asm fun getDepth() : Int { DEPTH }


/// Free functions testing inline functions, optionals, and arithmetic operators

// Regular function for adding two integers
fun testInlineAdd(a: Int, b: Int) : Int {
    return a + b;
}

// Inline function that should be inlined at call sites
inline fun inlineAdd(a: Int, b: Int) : Int {
    return a + b;
}

// Test non-null assertion operator (!!) on an optional Int
fun testNonNull() : Int {
    let opt: Int? = 10;
    return opt!! + 5;  // Expected to yield 15
}

// A simple arithmetic test combining augmented assignments
fun testArith() : Int {
    let a: Int = 7;
    a += 3; // now 10
    a -= 2; // now 8
    a *= 4; // now 32
    a /= 2; // now 16
    a %= 3; // now 1 (16 mod 3 = 1)
    return a;
}

// Function testing loop constructs individually (repeat, while, do...until, foreach)
fun testLoops() : Int {
    // Test repeat loop: multiply 1 by 2 ten times
    let twoPow: Int = 1;
    repeat (10) {
        twoPow *= 2;
    }
    
    // Test while loop: decrement from 10 to 0
    let x: Int = 10;
    while (x > 0) {
        x -= 1;
    }

    // Test do...until loop: decrement from 10 until 0
    let y: Int = 10;
    do {
        y -= 1;
    } until (y == 0);

    // Test foreach loop on a map
    let m: map<Int, Int> = emptyMap();
    m.set(1, 10);
    m.set(2, 20);
    let sum: Int = 0;
    foreach (key, value in m) {
        sum += value;
    }

    // Sum all the loop results: twoPow + x + y + sum
    return twoPow + x + y + sum; // Expected: 1024 + 0 + 0 + 30 = 1054
}

// Function testing try/catch and throwIf
fun testTryCatch() : Int {
    try {
        throwIf(111, true);
        return 0; // unreachable
    } catch (e) {
        return e; // expected: 111
    }
}

// Function testing nested try/catch
fun testNestedTry() : Int {
    try {
        try {
            throw(200);
        } catch (_) {
            throw(300);
        }
    } catch (err) {
        return err; // expected: 300
    }
}

// Main function combining various tests
fun main() : Int {
    let r1: Int = testInlineAdd(2, 3);  // Expected 5
    let r2: Int = inlineAdd(4, 5);        // Expected 9
    let r3: Int = testNonNull();          // Expected 15
    let r4: Int = testArith();            // Expected 1
    let r5: Int = getDepth();             // returns current TVM stack depth (value depends on initialization)
    let r6: Int = testLoops();            // Expected: 1054
    let r7: Int = testTryCatch();         // Expected: 111
    let r8: Int = testNestedTry();        // Expected: 300
    
    return r1 + r2 + r3 + r4 + r5 + r6 + r7 + r8;
}
