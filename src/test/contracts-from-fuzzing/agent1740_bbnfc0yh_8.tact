struct Combo {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    strVal: String;
}

contract ComplexStorage {
    combo: Combo;

    init() {
        self.combo = Combo{
            intVal: 42,
            boolVal: false,
            addrVal: myAddress(),
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            strVal: "world"
        };
    }
}