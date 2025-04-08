contract ManyPrimTypes {
    int_v: Int;
    bool_v: Bool;
    string_v: String;
    address_v: Address;
    cell_v: Cell;
    slice_v: Slice;

    init() {
        self.int_v = -42;
        self.bool_v = true;
        self.string_v = "abc";
        self.address_v = myAddress();
        self.cell_v = emptyCell();
        self.slice_v = emptyCell().asSlice();
    }
}