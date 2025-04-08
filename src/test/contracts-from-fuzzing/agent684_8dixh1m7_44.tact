// Using top level primitive fields
contract TopPrimitives {
    a: Int;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;
    sl: Slice;
    init() {
        self.a = 0;
        self.b = false;
        self.s = "";
        self.addr = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}