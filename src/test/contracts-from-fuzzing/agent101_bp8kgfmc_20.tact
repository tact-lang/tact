struct S1 { i: Int?; }

struct S2 { s: String?; }

struct ComboMany {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: S1?;
    f: S2?;
}

contract ManyOpts {
    data: ComboMany = ComboMany{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null,
        f: null,
    };

    init() {
        self.data = ComboMany{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: S1{ i: 2 },
            f: S2{ s: "s" },
        };
    }
}