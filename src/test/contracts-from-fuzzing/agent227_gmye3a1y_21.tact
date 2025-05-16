struct Combo {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addrVal: Address;
    sliceVal: Slice;
    builderVal: Builder;
    cellVal: Cell;
}

contract TestContract {
    d: Combo;

    init() {
        self.d = Combo{
            intVal: 77,
            boolVal: true,
            stringVal: "ok",
            addrVal: myAddress(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            cellVal: emptyCell()
        };
    }
}