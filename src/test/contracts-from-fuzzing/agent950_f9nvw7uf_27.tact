// Multiple contract fields with optionals
contract ManyFieldsOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}