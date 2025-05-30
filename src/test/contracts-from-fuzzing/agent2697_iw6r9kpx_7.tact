struct PrimNest {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    addrVal: Address;
}

contract DiverseTypes {
    vals: PrimNest;

    init() {
        self.vals = PrimNest{
            intVal: 1,
            boolVal: true,
            strVal: "hello",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            addrVal: myAddress(),
        };
    }
}
