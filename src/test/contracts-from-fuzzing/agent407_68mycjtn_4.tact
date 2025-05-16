contract EmptyInit {
    counter: Int;
    flag: Bool;
    message: String;
    data: Cell;
    sender_address: Address;
    slice_data: Slice;
    builder_obj: Builder;
    init() {
        self.counter = 0;
        self.flag = false;
        self.message = "";
        self.data = emptyCell();
        self.sender_address = myAddress();
        self.slice_data = emptyCell().asSlice();
        self.builder_obj = beginCell();
    }
}
