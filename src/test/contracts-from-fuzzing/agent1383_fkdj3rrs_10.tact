struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Address;
    i: Cell?;
    j: Address?;
}

contract WideContract {
    data: Wide;

    init() {
        self.data = Wide{
            a: 1,
            b: false,
            c: "hi",
            d: null,
            e: null,
            f: null,
            g: emptyCell(),
            h: myAddress(),
            i: null,
            j: null,
        };
    }
}
