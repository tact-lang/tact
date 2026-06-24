contract MultipleTypes {
    int_val: Int;
    bool_val: Bool;
    string_val: String;
    cell_val: Cell;
    slice_val: Slice;
    address_val: Address;
    nullable_bool: Bool?;
    nullable_string: String?;
    nullable_address: Address?;

    init() {
        self.int_val = 1;
        self.bool_val = true;
        self.string_val = "hello";
        self.cell_val = emptyCell();
        self.slice_val = self.cell_val.asSlice();
        self.address_val = myAddress();
        self.nullable_bool = null;
        self.nullable_string = null;
        self.nullable_address = null;
    }
}