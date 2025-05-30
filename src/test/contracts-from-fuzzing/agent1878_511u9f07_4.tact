struct Wide {
    a: Int?;
    b: Bool;
    c: Bool?;
    d: Int;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
}

contract Test {
    wide: Wide;

    init() {
        self.wide = Wide{
            a: null,
            b: true,
            c: null,
            d: 0,
            e: "x",
            f: null,
            g: emptyCell(),
            h: null,
            i: myAddress(),
            j: null,
        };
    }
}