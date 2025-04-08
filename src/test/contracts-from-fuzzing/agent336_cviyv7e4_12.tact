struct Inner {
    flag: Bool;
    number: Int;
}

contract TestContract {
    param1: Int;
    param2: Bool;
    nested: Inner;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;

    init() {
        self.param1 = 42;
        self.param2 = false;
        self.nested = Inner{ flag: true, number: 99 };
        self.s = "abc";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.addr = myAddress();
    }
}