struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: Bool?;
    h: Int?;
    i: String;
    j: Cell;
}

contract Test {
    data: Complex;
    init() {
        self.data = Complex{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell(),
            e: myAddress(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: "bye",
            j: emptyCell()
        };
    }
}