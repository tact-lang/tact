/*
Extended Fuzz-Testing: New Features

This file tests several additional Tact language features:

1. DestructuringWildcard: Uses wildcard in destructuring assignment to discard fields.
2. MapDeepEqualsTest: Checks the deepEquals extension method on maps.
3. ForeachExistsTest: Uses the exists() extension method on maps.
4. PrecedenceTest: Verifies arithmetic operator precedence.
5. TonTest: Verifies compile-time constant evaluation of ton().
6. OptionalCatch: Uses try-catch to catch a null reference exception from a non-null assertion.
*/

// 1. DestructuringWildcard
struct Two { first: Int; second: String }

contract DestructuringWildcard {
    get fun test(): Int {
        let Two { first, second: _ } = Two { first: 42, second: "hello" };
        return first; // Expected: 42
    }
}

// 2. MapDeepEqualsTest
contract MapDeepEqualsTest {
    get fun test(): Bool {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        m1.set(1, 100);
        m2.set(1, 100);
        return m1.deepEquals(m2); // Expected: true
    }
}

// 3. ForeachExistsTest
contract ForeachExistsTest {
    get fun test(): Bool {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(3, 300);
        return m.exists(3); // Expected: true
    }
}

// 4. PrecedenceTest
fun precedenceTest(): Int {
    // According to standard precedence, multiplication is done before addition:
    // 5 + 3 * 2 = 5 + 6 = 11
    return 5 + 3 * 2;
}

contract PrecedenceTest {
    get fun test(): Int {
        return precedenceTest(); // Expected: 11
    }
}

// 5. TonTest
const TON_42: Int = ton("42");

contract TonTest {
    get fun test(): Int {
        return TON_42; // Expected: the integer corresponding to ton("42")
    }
}

// 6. OptionalCatch
contract OptionalCatch {
    get fun test(): Int {
        try {
            let a: Int? = null;
            return a!!; // Should throw a null reference exception with exit code 128
        } catch (err) {
            return err; // Expected: 128
        }
    }
}
