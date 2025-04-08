contract MixPrimitiveOptional {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Cell;
    f: Slice?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = "mix";
        self.d = null;
        self.e = emptyCell();
        self.f = null;
    }
}