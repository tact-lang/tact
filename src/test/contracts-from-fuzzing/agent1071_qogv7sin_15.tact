struct MultiTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    stringOpt: String?;
}

contract StructCombo {
    s: MultiTypes;
    init() {
        self.s = MultiTypes{
            intVal: 12,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            stringVal: "x",
            intOpt: null,
            boolOpt: null,
            addrOpt: null,
            cellOpt: null,
            sliceOpt: null,
            stringOpt: null,
        };
    }
}