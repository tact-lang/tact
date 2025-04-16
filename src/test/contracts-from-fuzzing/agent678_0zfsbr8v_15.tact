struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract StructAsField {
    s: S;

    init() {
        self.s = S{
            a: 1,
            b: false,
            c: "x",
            d: null,
            e: null,
            f: null
        };
    }
}
