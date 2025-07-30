contract TestContract {
    int_field: Int = 1;
    bool_field: Bool = true;
    string_field: String = "hi";
    // purposely omit cell-related so they aren't const eval'd

    slice_field: Slice;
    builder_field: Builder;
    address_field: Address;

    init() {
        self.slice_field = emptyCell().asSlice();
        self.builder_field = beginCell();
        self.address_field = myAddress();
    }
}
