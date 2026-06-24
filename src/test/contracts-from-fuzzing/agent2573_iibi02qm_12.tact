struct OptionalRefs {
    addr: Address?;
    cellRef: Cell?;
    sliceRef: Slice?;
}

contract OptionalReferences {
    refs: OptionalRefs;

    init() {
        self.refs = OptionalRefs{
            addr: null,
            cellRef: null,
            sliceRef: null,
        };
    }
}