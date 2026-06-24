contract MultiTypeFields {
    flag: Bool;
    count: Int;
    note: String;
    data: Cell;
    hash: Slice;
    owner: Address;

    init() {
        self.flag = true;
        self.count = 42;
        self.note = "test";
        self.data = emptyCell();
        self.hash = emptyCell().asSlice();
        self.owner = myAddress();
    }
}