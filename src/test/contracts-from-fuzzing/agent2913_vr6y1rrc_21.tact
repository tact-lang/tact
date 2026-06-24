struct OptionalSliceCell {
    s: Slice?;
    c: Cell?;
}

contract OptSliceCellTest {
    f: OptionalSliceCell;
    
    init() {
        self.f = OptionalSliceCell{
            s: null,
            c: null,
        };
    }
}