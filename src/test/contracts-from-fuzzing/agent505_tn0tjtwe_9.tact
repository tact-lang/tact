struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
    g: Builder;
}

contract ManyTypes {
    data: Complex;

    init() {
        self.data = Complex{
            a: 1,
            b: true,
            c: "hi",
            d: myAddress(),
            e: emptyCell().asSlice(),
            f: emptyCell(),
            g: beginCell()
        };
    }
}
