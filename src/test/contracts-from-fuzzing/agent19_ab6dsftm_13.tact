/// This snippet tests several features:
/// 1. Inline functions
/// 2. Optional types and non-null assertion (!!)
/// 3. Basic arithmetic and operator usage

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
    // Using augmented assignments
    a += 3; // now 10
    a -= 2; // now 8
    a *= 4; // now 32
    a /= 2; // now 16
    a %= 3; // now 1 (16 mod 3 = 1)
    return a;
}

fun main() : Int {
    let r1: Int = testInlineAdd(2, 3);  // Expected 5
    let r2: Int = inlineAdd(4, 5);        // Expected 9
    let r3: Int = testNonNull();          // Expected 15
    let r4: Int = testArith();            // Expected 1
    return r1 + r2 + r3 + r4;             // Expected sum: 5 + 9 + 15 + 1 = 30
}
