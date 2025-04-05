/*
   SkipMaybeRefTest verifies that the extension mutation function skipMaybeRef
   properly skips a stored maybe reference in a Slice without modifying subsequent data.

   Approach:
   - Build a Cell that stores a maybe reference using storeMaybeRef(emptyCell()) followed by storing an unsigned integer 42 in 32 bits.
   - Convert to a Slice, then call skipMaybeRef() to skip the reference.
   - Load the 32-bit uint and require it equals 42.
*/

contract SkipMaybeRefTest() {
    receive() {
        let c: Cell = beginCell()
            .storeMaybeRef(emptyCell())
            .storeUint(42, 32)
            .endCell();
        let s: Slice = c.asSlice();
        s.skipMaybeRef();
        let x: Int = s.loadUint(32);
        require(x == 42, "skipMaybeRef did not work correctly");
        cashback(sender());
    }
}
