struct Multi {
    a: Int;
    b: String;
    c: Bool;
    d: Cell;
    e: Address;
    f: Int?;
    g: String?;
    h: Bool?;
    i: Cell?;
    j: Address?;
}

contract TestContract {
    m: Multi;

    init() {
        self.m = Multi{
            a: 1,
            b: "b",
            c: true,
            d: emptyCell(),
            e: myAddress(),
            f: null,
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}