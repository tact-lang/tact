struct Mix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Cell;
    f: Cell?;
    g: Address;
    h: Address?;
    i: String;
    j: String?;
}

contract FullVariety {
    mixed: Mix;

    init() {
        self.mixed = Mix{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: emptyCell(),
            f: null,
            g: myAddress(),
            h: null,
            i: "hello",
            j: null,
        };
    }
}
