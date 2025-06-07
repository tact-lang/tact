struct Complex {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: "hello",
            f: null,
            g: emptyCell(),
            h: null,
            i: myAddress(),
            j: null,
        };
    }
}