struct Wrap {
    intField: Int;
    boolField: Bool;
    strField: String;
    cellField: Cell;
    addrField: Address;
    optIntField: Int?;
    optBoolField: Bool?;
    optStrField: String?;
    optCellField: Cell?;
    optAddrField: Address?;
}

contract WideStruct {
    item: Wrap;

    init() {
        self.item = Wrap{
            intField: 1,
            boolField: false,
            strField: "hi",
            cellField: emptyCell(),
            addrField: myAddress(),
            optIntField: null,
            optBoolField: null,
            optStrField: null,
            optCellField: null,
            optAddrField: null
        };
    }
}