/*
 Testing throwIf behavior, as described in docs_cookbook_misc.md.
 The throwIf function should throw the exit code if the condition is true.
 If the condition is false, no error should be thrown.
*/

fun testThrowIf(condition: Bool): Int {
    try {
        // This will throw if condition true.
        throwIf(36, condition);
        // Return success code if no error thrown
        return 99;
    } catch (err) {
        return err;
    }
}

// We now test two cases:
// 1. When condition is true, expect the function to throw exit code 36
// 2. When condition is false, expect the function to return 99

fun main(): Int {
    let result1 = testThrowIf(true);  // Expect 36
    let result2 = testThrowIf(false); // Expect 99
    return result1 + result2; // 36 + 99 = 135 if correct
}
