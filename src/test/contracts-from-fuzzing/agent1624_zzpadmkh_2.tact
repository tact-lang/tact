struct ManyTypes {
    int_field: Int;
    bool_field: Bool;
    cell_field: Cell;
    builder_field: Builder;
    slice_field: Slice;
    string_field: String;
    opt_int: Int?;
    opt_bool: Bool?;
    opt_cell: Cell?;
    opt_builder: Builder?;
    opt_slice: Slice?;
    opt_string: String?;
}

contract BigTypes {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            int_field: 1,
            bool_field: true,
            cell_field: emptyCell(),
            builder_field: beginCell(),
            slice_field: emptyCell().asSlice(),
            string_field: "test",
            opt_int: null,
            opt_bool: null,
            opt_cell: null,
            opt_builder: null,
            opt_slice: null,
            opt_string: null
        };
    }
}