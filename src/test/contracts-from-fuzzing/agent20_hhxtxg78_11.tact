// Test 5 Final: Assembly function with 'mutates' attribute and arrangement, called as an extension method
// Adjusting the call syntax as the function is an extension on type Slice
asm(-> 1 0) extends mutates fun loadRefMutate(self: Slice): Cell { LDREF }

fun test_loadRefMutate() {
    let dummyCell: Cell = beginCell().endCell();
    let dummySlice: Slice = dummyCell.asSlice();
    let result: Cell = dummySlice.loadRefMutate();
}
