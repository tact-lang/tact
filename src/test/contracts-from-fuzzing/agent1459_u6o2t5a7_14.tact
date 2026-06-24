contract ManyPrimitives {
    number: Int;
    flag: Bool;
    s: String;
    data: Cell;
    pointer: Slice;
    addr: Address;

    init() {
        self.number = 123;
        self.flag = false;
        self.s = "hi";
        self.data = emptyCell();
        self.pointer = emptyCell().asSlice();
        self.addr = myAddress();
    }
}
