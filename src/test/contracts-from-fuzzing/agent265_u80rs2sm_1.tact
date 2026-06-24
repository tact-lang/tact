contract TestContract {
    flag: Bool;
    count: Int;
    address1: Address;
    text: String;
    cellData: Cell;
    sliceData: Slice;

    init() {
        self.flag = true;
        self.count = 42;
        self.address1 = myAddress();
        self.text = "Hello";
        self.cellData = emptyCell();
        self.sliceData = emptyCell().asSlice();
    }

    receive() {
        self.flag = false;
    }
}