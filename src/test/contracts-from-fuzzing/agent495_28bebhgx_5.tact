struct ManyTypes {
    val_i: Int;
    val_b: Bool;
    val_addr: Address;
    val_c: Cell;
    val_slice: Slice;
    val_str: String;
    opt_int: Int?;
    opt_bool: Bool?;
    opt_addr: Address?;
    opt_cell: Cell?;
    opt_slice: Slice?;
    opt_str: String?;
}

contract DifferentTypes {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            val_i: 1,
            val_b: true,
            val_addr: myAddress(),
            val_c: emptyCell(),
            val_slice: emptyCell().asSlice(),
            val_str: "abc",
            opt_int: null,
            opt_bool: null,
            opt_addr: null,
            opt_cell: null,
            opt_slice: null,
            opt_str: null
        };
    }
}
