contract NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Inner?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}

struct Inner {
    x: Int?;
    y: String?;
}