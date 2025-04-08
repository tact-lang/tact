struct MultiType {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
}

contract MultiTypeStorage {
    s: MultiType;

    init() {
        self.s = MultiType{
            intVal: 42,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "test",
        };
    }
}