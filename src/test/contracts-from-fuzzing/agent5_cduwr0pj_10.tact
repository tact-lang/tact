struct ManyTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
}

contract DiverseFields {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            intVal: 42,
            boolVal: true,
            strVal: "hello",
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
        };
    }
}
