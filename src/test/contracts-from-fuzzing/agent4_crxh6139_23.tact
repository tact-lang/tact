/*
   CellToSliceTest verifies that converting a Cell to a Slice and then reading back the stored value works correctly.
   It builds a cell storing an unsigned 8-bit integer (123), converts it to a Slice, loads the value, and checks it is 123.
*/

contract CellToSliceTest() {
    receive() {
        let cell = beginCell().storeUint(123, 8).endCell();
        let slice = cell.asSlice();
        let val = slice.loadUint(8);
        require(val == 123, "Cell to slice conversion failed");
        cashback(sender());
    }
}
