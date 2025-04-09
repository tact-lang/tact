contract AllPrimitiveTypes {
    num: Int;
    b: Bool;
    addr: Address;
    cl: Cell;
    sl: Slice;
    text: String;

    init() {
        self.num = 123;
        self.b = true;
        self.addr = myAddress();
        self.cl = emptyCell();
        self.sl = self.cl.asSlice();
        self.text = "hi";
    }
}