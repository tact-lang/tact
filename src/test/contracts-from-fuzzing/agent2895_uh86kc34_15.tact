struct XI {
    a: Int;
}
struct XS {
    s: String;
}
struct XB {
    b: Bool;
}

contract ManyNestedVariants {
    xi: XI;
    xs: XS;
    xb: XB;

    init() {
        self.xi = XI{ a: 5 };
        self.xs = XS{ s: "a" };
        self.xb = XB{ b: true };
    }
}
