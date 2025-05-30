contract PrimitiveTypes {
    integer: Int;
    boolean: Bool;
    string: String;
    address: Address;
    cell: Cell;
    slice: Slice;
    builder: Builder;

    init() {
        self.integer = 5;
        self.boolean = true;
        self.string = "abc";
        self.address = myAddress();
        self.cell = emptyCell();
        self.slice = emptyCell().asSlice();
        self.builder = beginCell();
    }
}