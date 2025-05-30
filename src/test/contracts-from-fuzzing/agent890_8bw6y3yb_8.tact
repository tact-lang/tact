struct Mixed {
    intField: Int;
    boolField: Bool;
    strField: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
}

contract Test {
    a: Int;
    b: Bool;
    c: String;
    d: Mixed;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = Mixed{
            intField: 42,
            boolField: false,
            strField: "hello",
            optInt: null,
            optBool: null,
            optStr: null,
            addr: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell()
        };
    }
}