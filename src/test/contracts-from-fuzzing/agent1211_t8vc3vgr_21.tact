struct OneBig {
    a: Int;
    b: Bool;
    c: Address;
    d: Int;
    e: String;
    f: Int;
    g: Cell;
    h: Bool;
    i: String;
    j: Address;
    k: Cell;
}

contract LotsOfFields {
    big: OneBig;
    init() {
        self.big = OneBig{
            a: 1,
            b: false,
            c: myAddress(),
            d: 4,
            e: "e",
            f: 6,
            g: emptyCell(),
            h: true,
            i: "nine",
            j: myAddress(),
            k: emptyCell(),
        };
    }
}