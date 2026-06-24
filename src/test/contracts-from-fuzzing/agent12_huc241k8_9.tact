// Summary of Conditional Statements Fuzz Testing

// This code aggregates various tests on Tact conditional statements as documented, including:
// 1. A standard if-else block, which compiles and executes as expected.
// 2. A nested if-else chain, used to test multiple branch conditions (a > 10, a > 0, etc.).
// 3. Ternary operator usage, confirmed to compile and execute correctly.
// 4. An attempted misuse of if as an expression in a let binding (commented out as expected failure).
// 5. Testing of an if without the else clause.

// All tests match the documented behaviors in the Tact documentation regarding conditionals.

fun test_if_statement(): Int {
    // Standard if-else block
    if (true) {
        return 1;
    } else {
        return 0;
    }
}

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

fun test_ternary(): Int {
    let res: Int = true ? 1 : 0;
    return res;
}

// The snippet below is commented out because using if as an expression in a let-binding is not permitted:
// fun test_if_expr(): Int {
//    let v: Int = if (true) { 1 } else { 0 };
//    return v;
// }

fun test_if_block(): Int {
    if (true) {
        let x: Int = 10;
        let y: Int = 20;
        return x + y;  // Expected: 30
    }
    return 0;
}

fun test_if_without_else(): Int {
    if (false) {
        return 999; // not executed
    }
    return 100; // Expected: 100
}

fun test_nested_ternary(): Int {
    let v: Int = false ? 1 : (true ? 2 : 3);
    return v; // Expected: 2
}

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
