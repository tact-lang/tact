struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Address?;
    j: Cell?;
}

contract Test {
    state: Complex;

    init() {
        self.state = Complex{
            a: 1,
            b: true,
            c: "hi",
            d: myAddress(),
            e: emptyCell(),
            f: null,
            g: null,
            h: null,
            i: null,
            j: null
        };
    }
}
