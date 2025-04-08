struct Mid {
    x: Int;
    y: Bool;
}

contract TestContract {
    num: Int as int64;
    posNum: Int as uint64;
    truth: Bool;
    addr: Address;
    slice: Slice;
    cell: Cell;
    text: String;
    nested: Mid;

    init() {
        self.num = -123;
        self.posNum = 123;
        self.truth = true;
        self.addr = myAddress();
        self.slice = emptyCell().asSlice();
        self.cell = emptyCell();
        self.text = "hello";
        self.nested = Mid{ x: 5, y: false };
    }
}