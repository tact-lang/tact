struct Complex {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
}

contract ComplexFields {
    data: Complex;

    init() {
        self.data = Complex{
            i: 1,
            b: true,
            s: "s",
            c: emptyCell(),
            a: myAddress(),
            oi: null,
            ob: null,
            os: null,
            oa: null
        };
    }
}