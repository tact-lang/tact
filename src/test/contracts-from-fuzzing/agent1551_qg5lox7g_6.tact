struct Complex {
    i: Int;
    s: String;
    b: Bool;
    addr: Address;
    cl: Cell;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
    optCell: Cell?;
}

contract Variety {
    f: Complex;

    init() {
        self.f = Complex{
            i: 1,
            s: "s",
            b: true,
            addr: myAddress(),
            cl: emptyCell(),
            optInt: null,
            optBool: false,
            optStr: null,
            optAddr: null,
            optCell: null,
        };
    }
}