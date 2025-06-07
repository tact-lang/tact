contract NestedOptionalsPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.d = null;
        self.e = null;
        self.f = null;
    }

    receive() {
        self.d = 4;
        self.e = false;
        self.f = "y";
    }
}