/*
   UnderflowTest verifies that attempting to load more bits than available in a Slice
   correctly triggers a cell underflow exception with exit code 9, as documented.
   
   In this test, we construct a cell that stores an unsigned integer 5 using 3 bits.
   The cell's slice then has exactly 3 bits available. We then attempt to load 4 bits from the slice,
   which should trigger an underflow error (exit code 9).
   The error is caught in a try...catch block, and we require that the caught exit code equals 9.
*/

contract UnderflowTest() {
    receive() {
        // Build a cell with an unsigned integer 5 stored in 3 bits (e.g., maximum value 7 possible)
        let cell = beginCell().storeUint(5, 3).endCell();
        let s = cell.asSlice();
        
        try {
            // Attempt to load 4 bits from the slice (only 3 available): should trigger an underflow, exit code 9
            let _ = s.loadUint(4);
            // If no error, then force failure (exit code must be thrown)
            require(false, "No underflow error thrown");
        } catch (code) {
            // Check if the caught exit code is 9 (Cell underflow)
            require(code == 9, "Unexpected exit code from underflow");
        }
        cashback(sender());
    }
}
