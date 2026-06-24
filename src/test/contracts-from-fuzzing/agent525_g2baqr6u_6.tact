struct S {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
}

contract Test {
    s: S;

    init() {
        self.s = S{
            a: 1,
            b: "b",
            c: true,
            d: 2,
            e: false,
            f: null,
            g: emptyCell()
        };
    }
}
