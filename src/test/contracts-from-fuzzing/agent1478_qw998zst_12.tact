struct Complex {
    i1: Int as uint8;
    i2: Int as int32;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
    opt: Int?;
}

contract TestContract {
    comp: Complex;

    init() {
        self.comp = Complex{
            i1: 1,
            i2: -12345,
            b: true,
            s: "abc",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress(),
            opt: null
        };
    }
}
