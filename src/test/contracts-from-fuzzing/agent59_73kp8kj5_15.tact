struct OptionalsWide {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract WideOptionalVars {
    data: OptionalsWide;

    init() {
        self.data = OptionalsWide {
            a: null, b: null, c: null, d: null, e: null, f: null
        };
    }
}
