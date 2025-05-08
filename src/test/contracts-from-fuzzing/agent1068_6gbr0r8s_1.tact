struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: String?;
    h: Int?;
}

contract Test {
    data: Complex;

    init() {
        self.data = Complex{
            a: 1,
            b: true,
            c: "foo",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: null,
        };
    }
}