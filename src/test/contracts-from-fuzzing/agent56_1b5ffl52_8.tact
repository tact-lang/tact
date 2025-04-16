contract MultiplePrimitives {
    foo: Int;
    bar: Bool;
    baz: String;
    addr: Address;
    cellField: Cell;
    sliceField: Slice;
    optInt: Int?;
    optString: String?;
    optBool: Bool?;

    init() {
        self.foo = 1;
        self.bar = false;
        self.baz = "test";
        self.addr = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.optInt = null;
        self.optString = null;
        self.optBool = true;
    }
}