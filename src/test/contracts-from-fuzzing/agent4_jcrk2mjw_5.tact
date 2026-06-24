// Testing advanced control flow features based on documentation insights

// Test 1: if statement with inline comments inside condition and proper curly braces
fun testIfWithComment() : Int {
    if (/* the condition is commented inline */ true) { 
        return 1; 
    } else { 
        return 2; 
    }
}

// Test 2: Nested ternary expression without extra parentheses to observe associativity
fun nestedTernary2() : Int {
    // Ternary operator should associate correctly: condition ? a : b ? c : d
    // Expected behavior: evaluate "false ? 1 : true ? 2 : 3" should yield 2
    return false ? 1 : true ? 2 : 3;
}

// Test 3: Empty if block vs explicit return outside, ensuring that function returns despite empty block
fun testEmptyIf() : Int {
    if (true) { 
        // intentionally empty block
    } else { 
        return 2; 
    }
    return 1;
}

// Test 4: Deliberately invalid if condition using an integer instead of a boolean
// This should produce a compilation error. We encapsulate it inside a comment block for demonstration.
/*
fun testIntegerCondition() : Int {
    if (1) { return 1; } else { return 0; }
}
*/

// Test 5: Proper try...catch with no unreachable code
fun testTryCatchValid() : Int {
    try {
        throw(101);
    } catch (err) {
        return err;
    }
}

// Expose functions to avoid "unused function" warning
fun main() : Int {
    let a = testIfWithComment();
    let b = nestedTernary2();
    let c = testEmptyIf();
    let d = testTryCatchValid();
    return a + b + c + d;
}
