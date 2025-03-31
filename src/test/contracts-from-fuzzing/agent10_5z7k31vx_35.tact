struct MyStruct { field1: Int; field2: Int }

// Complex expression using nested ternary and arithmetic precedence
fun complexExpr() : Int {
    // Expression: true ? (false ? 1 + 2 * 3 : 4 + 5 * 6) : (7 + 8 * 9)
    // Since the first condition is true, we evaluate the inner ternary.
    // false ? 1 + 2 * 3 : 4 + 5 * 6 computes to 4 + (5*6) = 4 + 30 = 34.
    return true ? (false ? 1 + 2 * 3 : 4 + 5 * 6) : (7 + 8 * 9);
}

// Exception chaining test: catch and rethrow inside nested try-catch
fun testExceptionChain() : Int {
    try {
        throw(10);
    } catch (e) {
        try {
            throw(e * 2);
        } catch (x) {
            return x; // expected: 10 * 2 = 20
        }
    }
    // Removed unreachable return
}

// Test arithmetic associativity (left-associative subtraction)
fun testAssociativity() : Int {
    return 1 - 2 - 3; // Expected: (1-2)-3 = -4
}

// Test renaming in destructuring assignment using a struct
fun testRename() : Int {
    let MyStruct { field1: f, field2: g } = MyStruct { field1: 42, field2: 58 };
    return f + g; // Expected: 42 + 58 = 100
}

fun main() : Int {
    // Aggregate test results
    // complexExpr() = 34
    // testExceptionChain() = 20
    // testAssociativity() = -4
    // testRename() = 100
    return complexExpr() + testExceptionChain() + testAssociativity() + testRename();
    // Total = 34 + 20 - 4 + 100 = 150
}
