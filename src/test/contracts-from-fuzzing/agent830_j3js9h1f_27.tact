contract ManyPrimitives {
    foo: Int;
    bar: Bool;
    baz: String;
    qux: Address;
    sliceField: Slice;
    cellField: Cell;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddr: Address?;
    optSlice: Slice?;
    optCell: Cell?;
    init() {
        self.foo = 1;
        self.bar = false;
        self.baz = "Test";
        self.qux = myAddress();
        self.sliceField = emptyCell().asSlice();
        self.cellField = emptyCell();
        self.optInt = null;
        self.optBool = true;
        self.optString = null;
        self.optAddr = null;
        self.optSlice = null;
        self.optCell = null;
    }
}