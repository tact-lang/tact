struct Data {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    addrVal: Address;
    sliceVal: Slice;
}

contract MultiTypeStore {
    data: Data;

    init() {
        self.data = Data{
            intVal: 1,
            boolVal: true,
            stringVal: "test",
            cellVal: emptyCell(),
            addrVal: myAddress(),
            sliceVal: emptyCell().asSlice()
        };
    }
}