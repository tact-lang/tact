struct Example { a: Int; b: Int }

fun test_destructure(): Int {
    // Destructuring assignment with trailing comma allowed in field list
    let Example { a, b, } = Example { a: 42, b: 58, };
    return a + b; // expected 42 + 58 = 100
}

fun test_optional_destructure(): Int {
    // Testing optional behavior with ternary operator
    let opt: Int? = null;
    return opt == null ? 1 : 0; // expected 1
}

fun test_nested_try(): Int {
    // Nested try-catch: inner try catches and returns modified error
    try {
        try {
            throw(99); // inner throw with exit code 99
        } catch (e) {
            return e + 1; // should return 100
        }
    } catch (e2) {
        return e2;
    }
    // unreachable code not needed
}

asm fun add42(a: Int): Int { a 42 ADD }

fun test_asm(): Int {
    return add42(10); // 10 + 42 = 52
}

fun main() {
    dump(test_destructure());              // expected output: 100
    dump(test_optional_destructure());       // expected output: 1
    dump(test_nested_try());                 // expected output: 100
    dump(test_asm());                        // expected output: 52
}
