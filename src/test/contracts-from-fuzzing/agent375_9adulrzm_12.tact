contract ManyPrimitiveOptions {
    int_opt: Int?;
    bool_opt: Bool?;
    string_opt: String?;
    cell_opt: Cell?;
    slice_opt: Slice?;
    builder_opt: Builder?;
    address_opt: Address?;

    init() {
        self.int_opt = null;
        self.bool_opt = true;
        self.string_opt = null;
        self.cell_opt = emptyCell();
        self.slice_opt = emptyCell().asSlice();
        self.builder_opt = beginCell();
        self.address_opt = myAddress();
    }
}
