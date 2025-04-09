struct Complex {
    a: Int;
    b: Bool;
    c: String?;
    d: Cell;
    e: Slice;
    f: Address;
    g: String;
}

contract MultiType {
    field: Complex;

    init() {
        self.field = Complex{
            a: 1,
            b: true,
            c: null,
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: "hi"
        };
    }
}