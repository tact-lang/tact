struct ManyTypedFields {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;
    addressVal: Address;
}

contract TestContract {
    payload: ManyTypedFields;

    init() {
        self.payload = ManyTypedFields{
            intVal: 42,
            boolVal: true,
            stringVal: "test",
            cellVal: emptyCell(),
            builderVal: beginCell(),
            sliceVal: emptyCell().asSlice(),
            addressVal: myAddress()
        };
    }
}