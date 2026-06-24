// Deep mix with optionals, nested, defaults, and wide fields
struct X1 { xa: Int?; xb: Bool?; }
struct X2 { xc: Int; xd: Bool = true; }
struct Huge {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: X1;
    f: X2;
    g: X1?;
    h: X2?;
}

contract TestContract {
    huge: Huge;

    init() {
        self.huge = Huge {
            a: 1,
            b: null,
            c: false,
            d: true,
            e: X1 { xa: null, xb: null },
            f: X2 { xc: 7, xd: false },
            g: null,
            h: null
        };
    }
}
