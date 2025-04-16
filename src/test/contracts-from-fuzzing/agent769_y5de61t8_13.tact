struct PrimitiveMix {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: String;
}

contract Mix {
    dat: PrimitiveMix;
    init() {
        self.dat = PrimitiveMix{
            i: 7,
            b: true,
            a: myAddress(),
            c: emptyCell(),
            s: "hi"
        };
    }
}