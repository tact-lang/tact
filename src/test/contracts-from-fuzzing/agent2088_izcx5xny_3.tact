struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract OptionalsEverywhere {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}