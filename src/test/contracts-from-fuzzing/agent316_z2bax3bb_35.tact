struct MixedOpt {
    b: Bool?;
    i: Int?;
    a: Address?;
    s: Slice?;
    c: Cell?;
    str: String?;
}

contract Test {
    data: MixedOpt;

    init() {
        self.data = MixedOpt{
            b: null,
            i: null,
            a: null,
            s: null,
            c: null,
            str: null
        };
    }
}
