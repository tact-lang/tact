/*
  Fuzz Test: Error Handling with try-catch in Tact
  ------------------------------------------------------------
  This snippet tests Tact's error handling mechanisms (try-catch).

  It performs two separate operations:
    1. Attempts to load an integer from an empty slice, which should trigger a cell underflow error (exit code 9).
    2. Successfully parses a cell to obtain a uint value.

  The expected behavior is that the first try block catches an error with exit code 9, while the second block successfully retrieves the value.
*/

fun testTryCatch() {
    // Test 1: Trigger cell underflow error by loading from an empty slice
    try {
        let x = emptySlice().loadInt(1); // This should trigger cell underflow (exit code 9)
        dump(x); // This line should not be reached
    } catch (exitCode) {
        dump(exitCode); // Expected to dump 9 (cell underflow)
    }

    // Test 2: Successfully parse a cell
    try {
        let cellData = beginCell()
            .storeUint(1, 8)  // store value 1 in 8 bits
            .endCell();
        let sliceData = cellData.beginParse();
        let y = sliceData.loadUint(8);
        dump(y); // Expected to dump 1
    } catch (exitCode) {
        dump(exitCode); // This block should not be executed
    }
}

fun main() {
    testTryCatch();
    return;
}
