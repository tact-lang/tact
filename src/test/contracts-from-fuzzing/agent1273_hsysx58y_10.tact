contract DeeplyNestedFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Address?;
    f: Cell;
    g: Slice?;
    h: Bool?;
    i: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = "str";
        self.e = null;
        self.f = emptyCell();
        self.g = null;
        self.h = null;
        self.i = null;
    }
}