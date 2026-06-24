contract TestRunes {
    int_field: Int;
    bool_field: Bool;
    string_field: String;
    address_field: Address;
    cell_field: Cell;
    slice_field: Slice;
    builder_field: Builder;
    optfield: Int?;

    init() {
        self.int_field = 10;
        self.bool_field = true;
        self.string_field = "hi";
        self.address_field = myAddress();
        self.cell_field = emptyCell();
        self.slice_field = emptyCell().asSlice();
        self.builder_field = beginCell();
        self.optfield = null;
    }
}