struct DiverseData {
    intVal: Int as uint32;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    nestedOpt: Int?;
}

contract TestContract {
    stored: DiverseData;

    init() {
        self.stored = DiverseData{
            intVal: 42,
            boolVal: true,
            addrVal: myAddress(),
            strVal: "hello",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            nestedOpt: null,
        };
    }
}