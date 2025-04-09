struct Data {
    intVal: Int as uint64;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    addrVal: Address;
    sliceVal: Slice;
}

contract TestContract {
    data: Data;

    init() {
        self.data = Data{
            intVal: 123,
            boolVal: true,
            strVal: "hi",
            cellVal: emptyCell(),
            addrVal: myAddress(),
            sliceVal: emptyCell().asSlice()
        };
    }
}