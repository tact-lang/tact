contract MixedMany {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Slice;
    f: Cell;
    g: Builder;

    init() {
        self.a = 10;
        self.b = null;
        self.c = "mix";
        self.d = null;
        self.e = emptyCell().asSlice();
        self.f = emptyCell();
        self.g = beginCell();
    }
}