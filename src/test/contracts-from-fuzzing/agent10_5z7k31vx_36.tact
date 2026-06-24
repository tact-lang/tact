// Comprehensive Fuzzing Cycle Continued

// We've now performed additional tests aimed at more subtle edge cases:

// 1. A foreach loop on an expression (emptyMap()) that's not a path expression, which correctly produces a compile-time error.

fun testForeachExpr() : Int {
    // This is expected to fail because foreach must be applied to a direct identifier or a chained property access (e.g., self.foo);
    // The following line will produce a compile error as documented
    // foreach (k, v in emptyMap()) { /* do nothing */ }  // Fails as expected
    return 0;
}

// 2. A complex expression mixing nested ternary operators and arithmetic. The expression
//    true ? (false ? 1 + 2 * 3 : 4 + 5 * 6) : (7 + 8 * 9) evaluates to 34, as expected.

fun complexExpr() : Int {
    return true ? (false ? 1 + 2 * 3 : 4 + 5 * 6) : (7 + 8 * 9);
}

// 3. Exception chaining: A try-catch nested pattern catches an exception and rethrows its double. The final value
//    is correctly returned as 20 (10 * 2).

fun testExceptionChain() : Int {
    try {
        throw(10);
    } catch (e) {
        try {
            throw(e * 2);
        } catch (x) {
            return x; // Should return 20
        }
    }
}

// 4. Test arithmetic associativity: 1 - 2 - 3 should be ((1 - 2) - 3) = -4.

fun testAssociativity() : Int {
    return 1 - 2 - 3;
}

// 5. Destructuring with renaming: Renaming fields 'field1' to 'f' and 'field2' to 'g' from a struct instance
//    produces the expected sum 42 + 58 = 100.

struct MyStruct { field1: Int; field2: Int }

fun testRename() : Int {
    let MyStruct { field1: f, field2: g } = MyStruct { field1: 42, field2: 58 };
    return f + g;
}

// 6. Aggregation of these test results: The sum of complexExpr (34), testExceptionChain (20),
//    testAssociativity (-4), and testRename (100) should equal 150.

fun main() : Int {
    return complexExpr() + testExceptionChain() + testAssociativity() + testRename();
}
