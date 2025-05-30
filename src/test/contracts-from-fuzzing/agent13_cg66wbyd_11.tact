struct OptionalsOnly {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract Test {
    data: OptionalsOnly;

    init() {
        self.data = OptionalsOnly{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}
