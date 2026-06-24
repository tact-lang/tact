struct Complex {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
}

contract ComplexFields {
    field: Complex;

    init() {
        self.field = Complex{
            a: 1,
            b: true,
            c: myAddress(),
            d: myCode(),
            e: myCode().asSlice(),
            f: "hi",
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
        };
    }
}