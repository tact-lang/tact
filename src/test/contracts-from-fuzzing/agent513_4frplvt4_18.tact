struct OptionalCombo {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: String?;
}

contract Test {
    optc: OptionalCombo;

    init() {
        self.optc = OptionalCombo {
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }

    receive() {}
}