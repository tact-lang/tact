contract OnlyOptionalStructs {
    a: SOpt?;
    b: SOpt?;
    c: SOpt?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}

struct SOpt {
    f: Int?;
    g: Bool?;
}
