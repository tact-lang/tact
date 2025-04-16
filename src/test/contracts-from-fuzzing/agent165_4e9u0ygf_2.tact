contract TestContract {
    i_field: Int = 1;
    b_field: Bool = true;
    s_field: String;
    c_field: Cell;
    sl_field: Slice;
    addr_field: Address;

    init() {
        self.i_field = 2;
        self.b_field = false;
        self.s_field = "world";
        self.c_field = emptyCell();
        self.sl_field = emptyCell().asSlice();
        self.addr_field = myAddress();
    }
}