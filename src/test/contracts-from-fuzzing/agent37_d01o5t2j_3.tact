contract MultiPrims {
    val_int: Int;
    val_bool: Bool;
    val_addr: Address;
    val_cell: Cell;
    val_str: String;
    init() {
        self.val_int = 1;
        self.val_bool = true;
        self.val_addr = myAddress();
        self.val_cell = emptyCell();
        self.val_str = "hello";
    }
}