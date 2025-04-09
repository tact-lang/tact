struct DiversePrims {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
}

contract DiversePrimsStruct {
    dat: DiversePrims;

    init() {
        self.dat = DiversePrims{
            intVal: 1,
            boolVal: false,
            strVal: "x",
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
        };
    }
}