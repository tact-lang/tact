struct Combo {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    strVal: String;
}

contract Test {
    combo: Combo;

    init() {
        self.combo = Combo{
            intVal: 123,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            strVal: "hi"
        };
    }

    receive() {}
}