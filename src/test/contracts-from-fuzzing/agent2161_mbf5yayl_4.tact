struct ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;
    strVal: String;
    addrVal: Address;
}

contract PrimitiveFields {
    storage: ManyPrimitives;

    init() {
        self.storage = ManyPrimitives{
            intVal: 1,
            boolVal: true,
            cellVal: emptyCell(),
            builderVal: beginCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "hello",
            addrVal: myAddress(),
        };
    }
}