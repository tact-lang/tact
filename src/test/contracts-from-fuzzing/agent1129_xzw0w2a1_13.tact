struct Tiny {
    a: Int;
}

contract ManyOptionalPrimitives {
    a: Int?;
    b: Cell?;
    c: Slice?;
    d: Bool?;
    e: Address?;
    f: String?;
    g: Tiny?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = null;
    }
}