contract ComplexFieldTypes {
    i: Int;
    b: Bool;
    s: String;
    slice: Slice;
    cell: Cell;
    builder: Builder;
    address: Address;
    optI: Int?;
    optB: Bool?;
    optS: String?;
    optSlice: Slice?;
    optCell: Cell?;
    optBuilder: Builder?;
    optAddress: Address?;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "test";
        self.slice = emptyCell().asSlice();
        self.cell = emptyCell();
        self.builder = beginCell();
        self.address = myAddress();
        self.optI = null;
        self.optB = null;
        self.optS = null;
        self.optSlice = null;
        self.optCell = null;
        self.optBuilder = null;
        self.optAddress = null;
    }
}