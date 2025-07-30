struct ManyTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
}

contract AllFields {
    fields: ManyTypes;

    init() {
        self.fields = ManyTypes{
            intVal: 42,
            boolVal: true,
            strVal: "x",
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice()
        };
    }
}