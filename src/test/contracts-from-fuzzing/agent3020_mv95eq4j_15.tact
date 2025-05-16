contract SerializationsTest {
    si: Int as int64;
    ui: Int as uint64;
    co: Int as coins;
    bi: Bool;
    addr: Address;
    text: String;
    cl: Cell;
    sl: Slice;

    init() {
        self.si = 123;
        self.ui = 456;
        self.co = 789;
        self.bi = true;
        self.addr = myAddress();
        self.text = "hi";
        self.cl = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}
