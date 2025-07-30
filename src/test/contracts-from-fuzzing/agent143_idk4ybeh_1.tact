contract ManyTypes {
    amount: Int as uint64;
    owner: Address;
    description: String;
    active: Bool;
    dataCell: Cell;
    pointer: Slice;
    builder: Builder;

    init() {
        self.amount = 42;
        self.owner = myAddress();
        self.description = "Test";
        self.active = true;
        self.dataCell = emptyCell();
        self.pointer = emptyCell().asSlice();
        self.builder = beginCell();
    }
}