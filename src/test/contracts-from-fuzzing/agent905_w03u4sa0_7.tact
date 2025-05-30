struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: Cell?;
    j: String?;
}

contract ManyTypes {
    data: Complex;
    init() {
        self.data = Complex{
            a: 1,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: false,
            i: null,
            j: null
        };
    }
}
