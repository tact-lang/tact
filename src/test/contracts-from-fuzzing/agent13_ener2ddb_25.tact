struct Combo {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
}

contract StructMix {
    data: Combo;

    init() {
        self.data = Combo{
            intVal: 1,
            boolVal: false,
            strVal: "str",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell()
        };
    }
}