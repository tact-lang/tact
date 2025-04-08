struct OptionalSliceCell {
    sl: Slice?;
    cl: Cell?;
}

contract OptionalSliceCellPersisted {
    f: OptionalSliceCell;

    init() {
        self.f = OptionalSliceCell{sl:null, cl:null};
    }
}