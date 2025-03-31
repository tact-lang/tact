// Comprehensive Fuzz-Testing Cycle – Continued
// This snippet aggregates several tests to exercise a wide array of Tact features: recursion, map operations (set, replace, and get with optionals), inline functions, ternary expressions, arithmetic precedence, foreach looping (including discarding values), assembly functions, and constant definitions. 

// Factorial recursion test (tail-recursive)
fun fact(n: Int, acc: Int) : Int {
    if (n == 0) {
        return acc;
    } else {
        return fact(n - 1, n * acc);
    }
}

// Map operations test: setting, replacing, and retrieving values
fun testMapOps() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 10);
    m.set(2, 20);
    m.replace(1, 15);
    let v: Int? = m.get(1);
    if (v != null) {
        return v!!; // should be 15
    } else {
        return 0;
    }
}

// Inline function test: simple addition
inline fun add(a: Int, b: Int) : Int {
    return a + b;
}

// Ternary expression and precedence tests
fun testTernary(n: Int): Int { 
    return n > 0 ? n : -n;
}

fun testPrecedence() : Int { 
    return 2 + 3 * 4; // Expected: 2 + (3*4) = 14
}

// Foreach loop with underscore usage to discard map values; it iterates over a small map but does not alter output
fun testForeachUnderscore() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 100);
    m.set(2, 200);
    foreach (k, _ in m) { /* iteration to verify underscore discards the value */ }
    return 42;
}

// Assembly function test: simple inline increment (Using INC opcode) 
asm fun asmInc(x: Int): Int { INC }

// Constant definition test
const GLOBAL_CONST: Int = 5 + 7; // computed at compile-time

// Aggregated test function
fun runTests() : Int {
    let a = fact(5, 1);          // 5! = 120
    let b = testMapOps();          // Expected: 15
    let c = add(3, 4);             // Expected: 7
    let d = testTernary(-10);      // Expected: 10
    let e = testPrecedence();      // Expected: 14
    let f = testForeachUnderscore(); // Expected: 42
    let g = asmInc(99);            // Expected: 100
    return GLOBAL_CONST + a + b + c + d + e + f + g; 
    // Calculation: 12 + 120 + 15 + 7 + 10 + 14 + 42 + 100 = 320
}

fun main() : Int {
    return runTests();
}
