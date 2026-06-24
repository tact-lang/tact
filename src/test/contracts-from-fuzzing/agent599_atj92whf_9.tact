contract MixedFields {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Cell;
    f: Slice?;
    init() {
        self.a = 5;
        self.b = null;
        self.c = "hi";
        self.d = null;
        self.e = emptyCell();
        self.f = null;
    }
}