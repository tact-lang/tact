/*
Advanced Fuzz Testing: Nested try...catch Exception Handling

This snippet is designed to thoroughly validate the behavior of nested try...catch blocks in Tact. It verifies that exceptions thrown in an inner try block are correctly caught by the corresponding catch blocks, and that error propagation follows the documented semantics. Note that division by zero in Tact typically triggers an error.

In this snippet:
- The outer try block deliberately throws an exception with a specific exit code (e.g., 1001).
- The outer catch block catches this exit code and then initiates a nested try block in which a division by zero is attempted, simulating a secondary error.
- The inner catch block captures the nested error's exit code and returns it.

This chain allows us to inspect the propagation and handling of errors in nested try...catch workflows.

Expected behavior: The function returns the exit code corresponding to the nested error (for instance, 4 for division by zero, if that is the expected error code in such a situation). The exact exit code may depend on the TVM's error handling for division by zero.
*/

fun tryCatchNestedTest() : Int {
    // Outer try block explicitly throws an exception with exit code 1001
    try {
        throw(1001);
    } catch (ex) {
        // Outer catch caught ex, now we initiate a nested try block
        try {
            // Force an error: division by zero
            let y: Int = 10 / 0;
            return y; // This point should not be reached
        } catch (nested) {
            // Return the exit code from the inner catch block
            return nested;
        }
    }
}

fun main() : Int {
    // Execute the nested try-catch test and return its result
    return tryCatchNestedTest();
}
