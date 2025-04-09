struct OptSliceCell {
    a: Slice?;
    b: Cell?;
}

contract OptSliceCellTest {
    val: OptSliceCell;

    init() {
        self.val = OptSliceCell{a:null,b:null};
    }
}
