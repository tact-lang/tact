contract DefaultsTest {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Cell;
    e: Address;
    f: Slice;
    g: Builder;

    init() {
        self.d = emptyCell();
        self.e = myAddress();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
    }
}