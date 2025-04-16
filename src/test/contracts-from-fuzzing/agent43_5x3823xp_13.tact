struct ManyTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addressVal: Address;
}

contract AllTypesPersist {
    store: ManyTypes;

    init() {
        self.store = ManyTypes{
            intVal: 1,
            boolVal: true,
            stringVal: "hi",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            addressVal: myAddress()
        };
    }
}
