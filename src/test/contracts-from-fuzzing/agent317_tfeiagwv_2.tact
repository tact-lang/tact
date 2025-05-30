struct S1 {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Address?;
}

contract WideContract {
    s: S1;

    init() {
        self.s = S1{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell(),
            e: myAddress(),
            f: null,
            g: false,
            h: null,
            i: null,
            j: null,
        };
    }
}