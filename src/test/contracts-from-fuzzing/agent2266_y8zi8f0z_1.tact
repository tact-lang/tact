contract Test {
    a: Int; b: Bool; c: String; d: Address; e: Cell; f: Builder; g: Slice;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = beginCell();
        self.g = emptyCell().asSlice();
    }
}
