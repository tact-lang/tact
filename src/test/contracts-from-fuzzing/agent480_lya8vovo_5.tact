struct ComboInner {
    one: Int;
    flag: Bool;
    txt: String;
    sl: Slice;
    cl: Cell;
    addr: Address;
    optionalInt: Int?;
}

contract ComboFields {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    addressVal: Address;
    optionalStr: String?;
    nested: ComboInner;

    init() {
        self.intVal = 9;
        self.boolVal = false;
        self.stringVal = "combo";
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.addressVal = myAddress();
        self.optionalStr = null;
        self.nested = ComboInner{
            one: 1,
            flag: true,
            txt: "inner",
            sl: emptyCell().asSlice(),
            cl: emptyCell(),
            addr: myAddress(),
            optionalInt: null,
        };
    }
}