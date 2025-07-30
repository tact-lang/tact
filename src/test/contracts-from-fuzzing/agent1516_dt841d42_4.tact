struct Complex {
    x: Int;
    y: Int;
    z: String;
    w: Bool?;
    s: Slice;
    c: Cell;
    b: Builder;
    addr: Address;
}

contract Test {
    data: Complex;
    init() {
        self.data = Complex{
            x: 1,
            y: 2,
            z: "abc",
            w: true,
            s: emptyCell().asSlice(),
            c: emptyCell(),
            b: beginCell(),
            addr: myAddress()
        };
    }
}
