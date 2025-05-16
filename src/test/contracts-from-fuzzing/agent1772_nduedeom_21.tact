struct BigMix {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bu: Builder;
    optInt: Int?;
    optStr: String?;
    optAddr: Address?;
}

contract BigMixContract {
    mix: BigMix;

    init() {
        self.mix = BigMix{
            i: 1,
            b: false,
            s: "mix",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
            optInt: null,
            optStr: null,
            optAddr: null
        };
    }
}