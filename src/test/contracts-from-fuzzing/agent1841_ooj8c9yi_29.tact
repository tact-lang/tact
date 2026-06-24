contract CompositePrimitives {
    flag: Bool = true;
    count: Int as uint64;
    hash: Cell;
    owner: Address;
    note: String;

    init() {
        self.flag = false;
        self.count = 123456789;
        self.hash = emptyCell();
        self.owner = myAddress();
        self.note = "ready";
    }
}
