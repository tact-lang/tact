struct Combo {
    intF: Int;
    boolF: Bool;
    strF: String;
    optInt: Int?;
    optBool: Bool?;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
}

contract ComboContract {
    s: Combo;
    init() {
        self.s = Combo{
            intF: 11,
            boolF: true,
            strF: "hi",
            optInt: 5,
            optBool: null,
            addr: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
        };
    }
}