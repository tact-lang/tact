struct Combo {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addressVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    addressOpt: Address?;
    sliceOpt: Slice?;
    cellOpt: Cell?;
}

contract EverythingCombo {
    data: Combo;

    init() {
        self.data = Combo{
            intVal: 1,
            boolVal: true,
            strVal: "abc",
            addressVal: myAddress(),
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            intOpt: null,
            boolOpt: null,
            strOpt: null,
            addressOpt: null,
            sliceOpt: null,
            cellOpt: null
        };
    }
}
