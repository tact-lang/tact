// Fuzz testing cycle starting with conditional statements based on Tact documentation

// Test 1: Standard if block produces expected behavior
fun test_if_statement(): Int {
    if (true) {
        return 1;
    } else {
        return 0;
    }
}

// Test 2: Non-boolean condition; should yield type error as documented
// (This snippet should fail to compile)
// fun test_invalid_if(): Int {
//     if (42) {
//         return 1;
//     }
//     return 0;
// }

// Test 3: Nested if-else chain for multiple branches
fun test_nested_if(a: Int): Int {
    if (a > 10) {
        return 100;
    } else if (a > 0) {
        return 50;
    } else if (a < 0) {
        return -1;
    } else {
        return 0;
    }
}

// Test 4: Ternary operator usage (documented as valid)
fun test_ternary(): Int {
    let res: Int = true ? 1 : 0;
    return res;
}

// Test 5: Deliberate misuse of if as an expression in a let binding (should be rejected)
// (This snippet should fail to compile)
// fun test_if_expr(): Int {
//    let v: Int = if (true) { 1 } else { 0 };
//    return v;
// }

// Test 6: Compound if block executing multiple statements
fun test_if_block(): Int {
    if (true) {
        let x: Int = 10;
        let y: Int = 20;
        return x + y;  // Expected: 30
    }
    return 0;
}

// Test 7: If without an else clause; when false, should simply skip the if block
fun test_if_without_else(): Int {
    if (false) {
        return 999; // not executed
    }
    return 100; // Expected: 100
}

// Test 8: Nested ternary operator with parentheses for clarity
fun test_nested_ternary(): Int {
    // Expected to evaluate inner ternary first; condition false then check inner
    let v: Int = false ? 1 : (true ? 2 : 3);
    return v; // Expected: 2
}

// Entry point to run all tests (the return value is irrelevant)
fun main() {
    test_if_statement();
    test_nested_if(15);
    test_nested_if(5);
    test_nested_if(-3);
    test_nested_if(0);
    test_ternary();
    test_if_block();
    test_if_without_else();
    test_nested_ternary();
}
