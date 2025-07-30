struct NestedRefs {
    maybeCell: Cell?;
    maybeSlice: Slice?;
}

contract OptionalReferences {
    refdata: NestedRefs;

    init() {
        self.refdata = NestedRefs{
            maybeCell: emptyCell(),
            maybeSlice: null,
        };
    }
}