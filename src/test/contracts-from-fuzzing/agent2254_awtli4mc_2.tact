contract TestContract {
    foo: Int;
    bar: Bool;
    addr: Address;
    content: Cell;
    sliceData: Slice;
    bigNumber: Int as int257;
    smallNumber: Int as uint4;
    flag: Bool;

    init() {
        self.foo = 1;
        self.bar = true;
        self.addr = myAddress();
        self.content = emptyCell();
        self.sliceData = emptyCell().asSlice();
        self.bigNumber = 123456789012345678901234567890;
        self.smallNumber = 5;
        self.flag = false;
    }
}