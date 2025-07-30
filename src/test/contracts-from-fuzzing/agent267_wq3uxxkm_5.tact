struct Wide {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
}

contract WideFields {
    big: Wide;

    init() {
        self.big = Wide{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: "abc",
            f: null,
            g: emptyCell(),
            h: null,
            i: myAddress(),
            j: null,
        };
    }
}