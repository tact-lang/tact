struct InnerMulti {
    a: Int;
    b: String?;
    c: Bool?;
}

struct OuterMulti {
    x: Int;
    y: InnerMulti;
    z: Int?;
}

contract ComplexNested {
    field: OuterMulti;

    init() {
        self.field = OuterMulti{
            x: 12,
            y: InnerMulti{ a: 34, b: null, c: true },
            z: null
        };
    }
}
