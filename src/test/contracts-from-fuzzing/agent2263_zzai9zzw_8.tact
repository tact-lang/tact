struct BigOne {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Slice?;
    i: Address;
    j: Address?;
}

contract Test {
    s: BigOne;

    init() {
        self.s = BigOne{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "hello",
            f: null,
            g: emptyCell(),
            h: null,
            i: myAddress(),
            j: null
        };
    }
}