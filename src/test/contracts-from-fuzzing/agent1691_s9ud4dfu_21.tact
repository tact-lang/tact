contract FieldOrdering {
    a: Int = 1;
    b: Bool = false;
    c: String = "str";
    d: Slice;
    e: Address;

    init() {
        self.d = emptyCell().asSlice();
        self.e = myAddress();
    }
}