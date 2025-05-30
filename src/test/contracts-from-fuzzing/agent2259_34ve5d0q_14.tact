contract BigOptionalNested {
    x: Int?;
    y: Bool?;
    s: StrNest?;

    init() {
        self.x = null;
        self.y = null;
        self.s = StrNest{
            a: null,
            b: "hi",
            c: null
        };
    }
}

struct StrNest {
    a: String?;
    b: String;
    c: Bool?;
}