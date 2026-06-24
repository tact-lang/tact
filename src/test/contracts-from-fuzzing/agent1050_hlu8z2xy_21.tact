struct Complex {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    cl: Cell;
    sl: Slice;
}

contract ComplexStorage {
    val: Complex;

    init() {
        self.val = Complex{
            i: 1,
            b: true,
            s: "txt",
            addr: myAddress(),
            cl: emptyCell(),
            sl: emptyCell().asSlice(),
        };
    }
}
