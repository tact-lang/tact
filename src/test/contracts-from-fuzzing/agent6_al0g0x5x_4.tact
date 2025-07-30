/* Additional Tests: 14-16 - Further Exploration of Control-Flow Semantics */

/* Test 14: Function with a try block that has no catch clause, so the exception propagates */
fun unhandled(): Int {
    try {
        throw(707);
    }
    // No catch block provided, so if an exception is thrown, control transfers to the caller
    return 2;
}

fun testUnhandled(): Int {
    try {
        return unhandled();
    } catch (e) {
        return e;  // Should catch the propagated exception (707)
    }
}

/* Test 15: While loop with mixed flow and early return inside try block */
fun loopMixedFlow(): Int {
    let i: Int = 0;
    try {
        while (i < 10) {
            i = i + 1;
            if (i == 5) {
                return i;  // Early exit when i reaches 5
            }
        }
        return i;
    } catch (err) {
        return err + 50;
    }
}

/* Test 16: Nested if conditions with throwIf used inside a try block
   - If 'a' equals 0, exception 111 is thrown
   - Else, if 'b' is negative, exception 222 is thrown
   - Otherwise, returns a*b
*/

fun nestedThrowCondition(a: Int, b: Int): Int {
    try {
        if (a == 0) {
            throw(111);
        } else {
            if (b < 0) {
                throw(222);
            } else {
                return a * b;
            }
        }
    } catch (err) {
        return err;
    }
}

/* Main entry point for additional tests */

fun main() {
    dump(testUnhandled());         // Expected: 707
    dump(loopMixedFlow());         // Expected: 5
    dump(nestedThrowCondition(0, 10));   // Expected: 111 because a == 0
    dump(nestedThrowCondition(3, -4));   // Expected: 222 because b is negative
    dump(nestedThrowCondition(3, 4));    // Expected: 12
}
