struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract ComplexStorage {
    data: Complex;

    init() {
        self.data = Complex{
            a: 1,
            b: true,
            c: "ok",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: false,
            i: null,
        };
    }
}