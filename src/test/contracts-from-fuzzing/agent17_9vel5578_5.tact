/* Additional Advanced Test: Rethrow Exception in Try-Catch
   This test checks that an exception can be caught, manipulated, and rethrown.
   According to Tact semantics, rethrown exceptions propagate to the caller if not further caught.
*/

fun rethrowTest(): Int {
    try {
        throw(70);
    } catch (e) {
        // Manipulate the caught error and rethrow it
        throw(e + 1);
    }
    // Unreachable, but here to indicate no return value on normal execution
}
