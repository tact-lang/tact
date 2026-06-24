contract Test {
    storage_bool: Bool;
    storage_int: Int;
    storage_address: Address;
    storage_cell: Cell;
    storage_slice: Slice;
    storage_string: String;
    init() {
        self.storage_bool = true;
        self.storage_int = 42;
        self.storage_address = myAddress();
        self.storage_cell = emptyCell();
        self.storage_slice = self.storage_cell.asSlice();
        self.storage_string = "hello";
    }
}