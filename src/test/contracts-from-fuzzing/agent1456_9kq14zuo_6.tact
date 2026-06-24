struct MixedPrimitives {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
}

contract MixedContract {
    data: MixedPrimitives;

    init() {
        self.data = MixedPrimitives{
            intVal: 1,
            boolVal: true,
            strVal: "test",
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell()
        };
    }
}
