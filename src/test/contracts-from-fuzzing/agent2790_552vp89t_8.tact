struct OptionalMix {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
}

contract Test {
    data: OptionalMix;

    init() {
        self.data = OptionalMix{
            i: null,
            b: null,
            s: null,
            a: null,
            c: null,
            sl: null
        };
    }
}