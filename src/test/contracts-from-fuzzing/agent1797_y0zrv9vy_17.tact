struct BigOptionalMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
    g: Int;
    h: Bool;
    i: String;
}

contract Test {
    bom: BigOptionalMix;
    init() {
        self.bom = BigOptionalMix{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: 7,
            h: false,
            i: "done"
        };
    }
}