contract TestContract {
    a: Int; b: Bool; c: String; d: Cell; e: Slice; f: Address;

    init() {
        self.a = 7;
        self.b = true;
        self.c = "hello";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
    }
}