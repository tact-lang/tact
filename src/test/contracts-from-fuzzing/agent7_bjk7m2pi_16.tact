///////////////////////////////////////////////////////////////////
// Extended Fuzz Testing Cycle Continued: Further Exploration of Subtle
// and Tricky Edge Cases in the Tact Compiler, excluding known issues.
//
// This snippet includes tests for:
// 1. Recursion: factorial computation
// 2. Complex nested ternary operator expressions
// 3. Accessing missing keys in maps with non-null assertion (!!)
// 4. A simple inline assembly function returning a constant
///////////////////////////////////////////////////////////////////

// Test 1: Recursion - Factorial computation
fun factorial(n: Int): Int {
    if (n <= 1) { 
        return 1; 
    } else { 
        return n * factorial(n - 1);
    }
}

fun testFactorial() {
    // 6! = 720
    dump(factorial(6)); // expected output: 720
}

// Test 2: Complex nested ternary operator expression
fun testComplexTernary() {
    // Evaluate: true ? (false ? 1 : 2) : (true ? 3 : 4)
    // Since condition is true, inner false leads to 2
    dump(true ? (false ? 1 : 2) : (true ? 3 : 4)); // expected: 2
}

// Test 3: Accessing missing key in a map using non-null assertion (!!)
fun testMapMissingKey() {
    let m: map<Int, Int> = emptyMap();
    // Attempt to get a value for a non-existing key. Using !! should cause a runtime error.
    try {
        let v: Int = m.get(1)!!;
        dump(v); // Should not reach here
    } catch (err) {
        dump(err); // expected to dump an error code (e.g., 128 for null reference or another code for dictionary error)
    }
}

// Test 4: A simple inline assembly function returning a constant
asm fun push42(): Int { 
    // This inline assembly should simply push the constant 42 onto the stack
    // The syntax here uses a bare constant as assembly code.
    42
}

fun testPush42() {
    dump(push42()); // expected output: 42
}

// Main function: Execute all tests in sequence
fun main() {
    testFactorial();        // expected dump: 720
    testComplexTernary();     // expected dump: 2
    testMapMissingKey();      // expected dump: error code (e.g., 128 or similar)
    testPush42();             // expected dump: 42
}
