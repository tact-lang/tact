struct Combo {
    intVal: Int;
    stringVal: String;
    boolVal: Bool;
    builderVal: Builder;
    sliceVal: Slice;
    cellVal: Cell;
    addrVal: Address;
}

contract AllTogether {
    data: Combo;

    init() {
        self.data = Combo{
            intVal: 10,
            stringVal: "s",
            boolVal: false,
            builderVal: beginCell(),
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            addrVal: myAddress(),
        };
    }
}