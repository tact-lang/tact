contract ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    e: Cell; // no default
    f: Slice; // no default
    init() {
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}