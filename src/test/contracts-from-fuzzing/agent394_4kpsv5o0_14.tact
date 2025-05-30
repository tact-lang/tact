contract Defaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "abc";
    d: Slice;
    e: Cell;
    f: Address;
    init() {
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = myAddress();
    }
}