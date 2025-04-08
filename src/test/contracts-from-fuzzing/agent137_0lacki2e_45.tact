struct OptionalSliceOrCell {
    s: Slice?;
    c: Cell?;
}

contract TestOptionalSliceCell {
    v: OptionalSliceOrCell;
    init() {
        self.v = OptionalSliceOrCell{
            s:null,c:null
        };
    }
}