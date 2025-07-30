struct Combo {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
}

contract TestContract {
    c: Combo;
    init() {
        self.c = Combo{
            intVal: 321,
            boolVal: false,
            strVal: "xyz",
            addrVal: myAddress(),
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell()
        };
    }
}