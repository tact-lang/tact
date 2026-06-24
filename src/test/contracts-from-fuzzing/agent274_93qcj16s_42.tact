struct PrimMix {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract PrimMixContract {
    x: PrimMix;

    init() {
        self.x = PrimMix{
            a: 1,
            b: true,
            c: "abc",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }
}