struct OptionalStuff {
    a: Int?;
    b: Address?;
    c: Bool?;
    d: Int?;
    e: Address?;
    f: Bool?;
}

contract TestContract {
    opts: OptionalStuff;

    init() {
        self.opts = OptionalStuff{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}
