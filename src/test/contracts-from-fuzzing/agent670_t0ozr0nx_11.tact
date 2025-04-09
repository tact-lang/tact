struct Complex {
    a: Int?;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            a: null,
            b: true,
            c: "test",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
        };
    }
}