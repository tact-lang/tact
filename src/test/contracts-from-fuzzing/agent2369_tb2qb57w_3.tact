contract ManyTypes {
    int_field: Int = 7;
    bool_field: Bool = true;
    addr_field: Address;
    cell_field: Cell;
    slice_field: Slice;
    string_field: String = "abc";

    init() {
        self.addr_field = myAddress();
        self.cell_field = emptyCell();
        self.slice_field = emptyCell().asSlice();
    }
}