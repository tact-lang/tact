contract TestContract {
    int_field: Int;
    bool_field: Bool;
    addr_field: Address;
    cell_field: Cell;
    slice_field: Slice;
    str_field: String;
    
    init() {
        self.int_field = 1;
        self.bool_field = true;
        self.addr_field = myAddress();
        self.cell_field = emptyCell();
        self.slice_field = emptyCell().asSlice();
        self.str_field = "hello";
    }
}