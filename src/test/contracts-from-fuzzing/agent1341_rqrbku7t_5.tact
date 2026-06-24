struct Composite {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
}

contract CompositeField {
    data: Composite;

    init() {
        self.data = Composite{
            intVal: 5,
            boolVal: false,
            addrVal: myAddress(),
            strVal: "hi",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
        };
    }
}