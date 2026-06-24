contract Test29 {
    int_op: Int?;
    bool_op: Bool?;
    addr_op: Address?;
    cell_op: Cell?;
    slice_op: Slice?;
    str_op: String?;

    init() {
        self.int_op = null;
        self.bool_op = null;
        self.addr_op = null;
        self.cell_op = null;
        self.slice_op = null;
        self.str_op = null;
    }

    receive() {}
}