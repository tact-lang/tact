struct MixPrimitivesOpt {
    a: Int;
    b: Bool;
    c: String;
    d: Address?;
    e: Cell;
    f: Slice;
}

contract TestMixPrimOpt {
    data: MixPrimitivesOpt;
    init() {
        self.data = MixPrimitivesOpt{
            a: 1,
            b: true,
            c: "abc",
            d: null,
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}