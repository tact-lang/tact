struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: Int?;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: Address;
    l: Address?;
    m: Int;
    n: Bool;
    o: Int?;
    p: Bool?;
    q: String;
}

contract ManyFields {
    big: Complex;

    init() {
        self.big = Complex{
            a: 1,
            b: false,
            c: "x",
            d: null,
            e: null,
            f: null,
            g: emptyCell(),
            h: null,
            i: emptyCell().asSlice(),
            j: null,
            k: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            l: null,
            m: -1,
            n: true,
            o: 0,
            p: false,
            q: "done",
        };
    }
}