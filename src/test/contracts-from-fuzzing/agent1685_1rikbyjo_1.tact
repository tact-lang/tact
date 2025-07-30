struct Complex {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            a: 1,
            b: true,
            c: myAddress(),
            d: "Hello",
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }
}
