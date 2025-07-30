contract DefaultsManyTypes {
    a: Int = 5;
    b: Bool = false;
    s: String = "";
    c: Cell;
    addr: Address;
    sl: Slice;

    init() {
        self.c = emptyCell();
        self.addr = myAddress();
        self.sl = emptyCell().asSlice();
    }
}