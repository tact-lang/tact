struct OptionalsDeep {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract OptDeepStruct {
    data: OptionalsDeep;

    init() {
        self.data = OptionalsDeep {
            a: null, b: null, c: null, d: null, e: null, f: null, g: null
        };
    }
}
