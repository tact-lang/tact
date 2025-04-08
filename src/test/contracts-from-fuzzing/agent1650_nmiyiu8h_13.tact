struct Complex {
    s: String;
    b: Bool;
    c: Cell;
    sl: Slice;
    addr: Address;
}

contract ComplexFieldContract {
    data: Complex;

    init() {
        self.data = Complex{
            s: "abc",
            b: true,
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress(),
        };
    }
}