struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: String?;
    i: Bool?;
}

contract ManyComplex {
    x: Complex;
    y: Complex;

    init() {
        self.x = Complex{
            a: 1,
            b: true,
            c: "x",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null,
        };
        self.y = Complex{
            a: 2,
            b: false,
            c: "y",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null,
        };
    }
}
