contract FieldsWithInit {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: String = "test";
    e: Cell;
    f: Slice;
    g: Builder;

    init() {
        self.c = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
    }
}