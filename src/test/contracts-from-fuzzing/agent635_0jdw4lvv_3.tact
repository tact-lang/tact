struct Params {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Address?;
    j: Cell?;
}

contract Test {
    p: Params;
    init() {
        self.p = Params{
            a: 1,
            b: true,
            c: "x",
            d: myAddress(),
            e: emptyCell(),
            f: null,
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}