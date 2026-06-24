struct LongOptionalMix {
    a: Int?;
    b: Int;
    c: Bool?;
    d: Bool;
    e: Address?;
    f: Address;
    g: String?;
    h: String;
    i: Cell?;
    j: Slice;
}

contract TestContract {
    mix: LongOptionalMix;
    init() {
        self.mix = LongOptionalMix{
            a: null,
            b: 1,
            c: null,
            d: true,
            e: null,
            f: myAddress(),
            g: null,
            h: "hi",
            i: null,
            j: emptyCell().asSlice()
        };
    }
}