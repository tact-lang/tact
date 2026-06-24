struct S1 {
    a: Int as uint4;
    b: Bool;
    c: Int as int16;
    d: String?;
}

struct S2 {
    x: Int;
    y: S1;
    z: Bool?;
}

contract WeirdOrdering {
    sto: S2 = S2{
        x: 12345,
        y: S1{ a: 15, b: false, c: -123, d: null },
        z: null
    };

    init() {
        self.sto = S2{
            x: 42,
            y: S1{ a: 7, b: true, c: 321, d: "ok" },
            z: true
        };
    }
}