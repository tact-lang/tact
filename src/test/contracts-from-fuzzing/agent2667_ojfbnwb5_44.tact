contract AllPrimitiveFields {
    ai: Int;
    bl: Bool;
    addr: Address;
    cl: Cell;
    sl: Slice;
    str: String;

    init() {
        self.ai = 1;
        self.bl = true;
        self.addr = myAddress();
        self.cl = emptyCell();
        self.sl = emptyCell().asSlice();
        self.str = "hello";
    }

    receive() {
        self.ai = 2;
        self.bl = false;
        self.addr = myAddress();
        self.cl = emptyCell();
        self.sl = emptyCell().asSlice();
        self.str = "bye";
    }
}