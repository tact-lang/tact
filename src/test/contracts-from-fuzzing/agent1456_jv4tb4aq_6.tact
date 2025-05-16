struct LargeFlat {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Int?;
    g: Bool?;
    h: Address?;
    i: String?;
    j: Cell;
    k: Bool;
    l: String;
    m: Int;
    n: Address;
    o: String?;
}

contract TestContract {
    big: LargeFlat;

    init() {
        self.big = LargeFlat{
            a: 1,
            b: true,
            c: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            d: "d",
            e: emptyCell(),
            f: null,
            g: false,
            h: null,
            i: "i",
            j: emptyCell(),
            k: true,
            l: "l",
            m: 42,
            n: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            o: null,
        };
    }

    receive() {
        self.big = self.big;
    }
}