struct Complex {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
    sl: Slice;
    bu: Builder;
    optI: Int?;
    optB: Bool?;
}

contract TestContract {
    complex: Complex;

    init() {
        self.complex = Complex{
            i: 1,
            b: true,
            s: "hello",
            c: emptyCell(),
            a: myAddress(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
            optI: 42,
            optB: null
        };
    }
}