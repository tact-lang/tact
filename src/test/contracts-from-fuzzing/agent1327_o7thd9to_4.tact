contract Test {
    x: Int as uint8;
    y: Int as int64;
    flag: Bool;
    addr: Address;
    cellData: Cell;
    sliceData: Slice;
    greeting: String;

    init() {
        self.x = 7;
        self.y = -12345;
        self.flag = true;
        self.addr = myAddress();
        self.cellData = emptyCell();
        self.sliceData = emptyCell().asSlice();
        self.greeting = "hello";
    }
}